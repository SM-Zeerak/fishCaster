import 'package:fish_caster/bloc/share_prefrences/user_shared/user_shared_helper.dart';
import 'package:fish_caster/import_file.dart';
import 'package:fish_caster/screen/auth_screen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // For Timer

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Timer function to navigate to the next screen after 3 seconds
  @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 3), () {
  //     // After 3 seconds, navigate to the HomeScreen
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => Loginscreen()),
  //     );
  //   });
  // }
  void initState() {
    super.initState();

    // loadUserAndSaveToBloc(context);

    Future.delayed(Duration(seconds: 3), () {
      loadUserAndSaveToBloc(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemedBackground(
        child: Center(
          child: Container(
            width: 350,
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImgCons.fullLogo)),
            ),
          ),
        ),
      ),
    );
  }
}
