import 'package:fish_caster/import_file.dart';
import 'package:fish_caster/screen/auth_screen/loginScreen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemedBackground(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Container(
                width: SizeCons.getWidth(context) * 0.8,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImgCons.small_logo),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Sign up",
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 40),
                    CustomTextField(
                      controller: nameController,
                      hintText: 'Name',
                      suffixIcon: ImgCons.nameIcon,
                    ),
                    SizedBox(height: 40),
                    CustomDateField(
                      controller: dateController,
                      hintText: "Birth Date",
                      onDateSelected: (pickedDate) {
                        // Do something with the picked date
                      },
                    ),
                    SizedBox(height: 40),
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
                    CustomButton(text: "Signup", onPressed: () {}, width: 220),
                    SizedBox(height: 60),

                    CustomText(text: "Already have an account?", fontSize: 20),
                    SizedBox(height: 20),
                    CustomButton(
                      text: "Login",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginscreen(),
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

      // resizeToAvoidBottomInset: false,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(left: 30),
      //   child: Container(
      //     width: double.infinity,
      //     height: 100,
      //     child: Column(
      //       children: [
      //         CustomText(text: "Already have an account?", fontSize: 20),
      //         SizedBox(height: 20),
      //         CustomButton(
      //           text: "Login",
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => Loginscreen()),
      //             );
      //           },
      //           width: 220,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
