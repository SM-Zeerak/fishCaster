import 'dart:io';

import 'package:fish_caster/bloc/token/token_bloc.dart';
import 'package:fish_caster/bloc/token/token_event.dart';
import 'package:fish_caster/bloc/token/token_state.dart';
import 'package:fish_caster/bloc/user/user_bloc.dart';
import 'package:fish_caster/bloc/user/user_event.dart';
import 'package:fish_caster/bloc/user/user_state.dart';
import 'package:fish_caster/import_file.dart';
import 'package:fish_caster/screen/home_screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String token = '';
  String userId = '';

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserEvent());
    context.read<TokenBloc>().add(GetTokenEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoaded) {
          nameController.text = state.user.name;
          emailController.text = state.user.email;
          userId = state.user.id;
        }
      },
      child: BlocListener<TokenBloc, TokenState>(
        listener: (context, state) {
          if (state is TokenLoaded) {
            token = state.token;
          }
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          body: ThemedBackground(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: SizeCons.getWidth(context) * 0.8,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        CustomText(
                          text: "Profile",
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 40),
                        // GestureDetector(
                        //   onTap: () {
                        //     showImageSourceDialog(context, _pickImage);
                        //   },
                        //   child: Container(
                        //     width: 100,
                        //     height: 100,
                        //     child: Stack(
                        //       children: [
                        //         Container(
                        //           width: 100,
                        //           height: 100,
                        //           decoration: BoxDecoration(
                        //             shape: BoxShape.circle,
                        //             image: DecorationImage(
                        //               image:
                        //                   _imageFile != null
                        //                       ? FileImage(_imageFile!)
                        //                           as ImageProvider
                        //                       : AssetImage(ImgCons.profile),

                        //               fit: BoxFit.fill,
                        //             ),
                        //           ),
                        //         ),
                        //         Align(
                        //           alignment: Alignment.bottomRight,
                        //           child: Padding(
                        //             padding: const EdgeInsets.only(
                        //               bottom: 5,
                        //               right: 5,
                        //             ),
                        //             child: Container(
                        //               width: 20,
                        //               height: 20,
                        //               decoration: BoxDecoration(
                        //                 shape: BoxShape.circle,
                        //                 color: Colors.white,
                        //               ),
                        //               child: Icon(
                        //                 Icons.add,
                        //                 color: ClrCons.blackColor,
                        //                 size: 18,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 40),
                        CustomTextField(
                          controller: nameController,
                          hintText: 'Name',
                          suffixIcon: ImgCons.nameIcon,
                        ),
                        SizedBox(height: 40),
                        // CustomDateField(
                        //   controller: dateController,
                        //   hintText: "Birth Date",
                        //   onDateSelected: (pickedDate) {
                        //     // Do something with the picked date
                        //   },
                        // ),
                        // SizedBox(height: 40),
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Email',
                          suffixIcon: ImgCons.mailIcon,
                        ),
                        SizedBox(height: 40),
                        CustomTextField(
                          controller: passController,
                          hintText: 'Password',
                          isPassword: true,
                        ),
                        SizedBox(height: 40),
                        CustomButton(
                          text: "Edit Profile",
                          suffixIcon: ImgCons.editIcon,
                          onPressed: () {
                            BlocProvider.of<UserBloc>(context).add(
                              UpdateProfileEvent(
                                token: token,
                                userId: userId,
                                name: nameController.text,
                                email: emailController.text,
                              ),
                            );
                          },
                          width: 220,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
