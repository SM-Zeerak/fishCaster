import 'package:fish_caster/import_file.dart';
import 'package:fish_caster/screen/auth_screen/signupScreen.dart';
import 'package:fish_caster/screen/home_screen/homeScreen.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemedBackground(
        child: SafeArea(
          child: Center(
            child: Container(
              width: SizeCons.getWidth(context) * 0.8,
              child: SingleChildScrollView(
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
                      text: "Login",
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 40),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                    ),
                    SizedBox(height: 40),
                    CustomTextField(
                      controller: passController,
                      hintText: 'Password',
                      isPassword: true,
                    ),
                    SizedBox(height: 40),
                    CustomButton(
                      text: "Login",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      width: 220,
                    ),
                    SizedBox(height: 40),

                    CustomText(text: "Continue with", fontSize: 20),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ClrCons.socialIcon.withOpacity(0.85),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(ImgCons.gooGleIcon),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ClrCons.socialIcon.withOpacity(0.85),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(ImgCons.appleIcon),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),

                    CustomText(text: "Forget Password?", fontSize: 20),
                    SizedBox(height: 40),

                    CustomText(text: "Don't have an account?", fontSize: 20),
                    SizedBox(height: 20),
                    CustomButton(
                      text: "Sign up",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
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
    );
  }
}
