import 'package:fish_caster/api_services/auth_service/auth_service.dart';
import 'package:fish_caster/bloc/token/token_bloc.dart';
import 'package:fish_caster/bloc/token/token_event.dart';
import 'package:fish_caster/import_file.dart';
import 'package:fish_caster/screen/auth_screen/loginScreen.dart';
import 'package:fish_caster/screen/home_screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  // TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool _isloading = false;

  // Regex for email validation
  RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );

  RegExp passwordRegExp = RegExp(
    r'^(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$',
  );

  bool _validateForm() {
    String name = nameController.text.trim();

    String email = emailController.text.trim();
    String password = passController.text;

    // Check if the name is empty
    if (name.isEmpty) {
      _showError("Name is required.");
      return false;
    }
   
    // Validate email format
    if (!emailRegExp.hasMatch(email)) {
      _showError("Please enter a valid email.");
      return false;
    }

    // Validate password strength
    if (!passwordRegExp.hasMatch(password)) {
      _showError(
          "Password must be at least 6 characters long, with 1 uppercase letter and 1 special character.");
      return false;
    }

   
    return true;
  }

  // Show error message using SnackBar
  void _showError(String message) {
    globalSnack.showSnackBar(context, message);
  }

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
                    CustomButton(text: "Signup", onPressed: () async{
                       final prefs =
                                  await SharedPreferences.getInstance();

                              if (_validateForm()) {
                                setState(() {
                                  _isloading = true;
                                });

                                AuthService authService = AuthService();

                                Map<String, String>? tokens =
                                    await authService.registerUser(
                                  context,
                                  emailController.text,
                                  passController.text,
                                  nameController.text,

                                );

                                if (tokens != null) {
                                  String accessToken = tokens["accessToken"]!;
                                  String refreshToken = tokens["refreshToken"]!;

                                  await prefs.setString(
                                      'refreshToken', refreshToken);

                                  // Store both tokens in TokenBloc
                                  BlocProvider.of<TokenBloc>(context).add(
                                      SaveTokenEvent(
                                          accessToken, refreshToken));

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider.value(
                                        value:
                                            BlocProvider.of<TokenBloc>(context),
                                        child: Loginscreen()
                                      ),
                                    ),
                                  );
                                } else {
                                  _showError(
                                      "Registration failed. Please try again.");
                                }

                                setState(() {
                                  _isloading = false;
                                });
                              }
                    }, width: 220),
                    SizedBox(height: 150),

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
