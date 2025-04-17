import 'package:flutter/material.dart';
import 'package:fish_caster/import_file.dart';

class globalSnack {
  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: CustomText(
        text: message,
        color: ClrCons.whiteColor,
      ),
      duration: Duration(seconds: 3),
      backgroundColor: const Color.fromARGB(255, 35, 53, 106),
    );

    // Show the snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
