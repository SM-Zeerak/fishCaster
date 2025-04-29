import 'package:fish_caster/core/color_cons.dart';
import 'package:fish_caster/widgets/Theme/themedBackground.dart';
import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Text(
                _termsAndConditions,
                style:  TextStyle(fontSize: 14, height: 1.6, color: ClrCons.whiteColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


const String _termsAndConditions = '''
**Terms & Conditions**

Effective Date: April 18, 2025

Welcome to our weather forecasting app designed for fishers and outdoor marine users. Please read these terms carefully.

**1. Use of the App**
By using this app, you agree to comply with and be bound by these Terms & Conditions.

**2. App Purpose**
The app provides real-time and forecast-based weather data including temperature, wind, water conditions, and weather alerts for fishing and outdoor use.

**3. No Liability**
We do our best to provide accurate data. However, weather conditions may change rapidly. We are not responsible for any fishing-related losses or safety incidents.

**4. User Conduct**
You agree not to misuse the app, attempt to hack or reverse-engineer any part, or post false information.

**5. Intellectual Property**
All content, branding, and algorithms are owned by the app developers. Unauthorized use is prohibited.

**6. Termination**
We reserve the right to suspend or terminate access if you violate these terms.

**7. Changes to Terms**
These terms may be updated periodically. Continued use indicates acceptance of updated terms.

For support or questions, contact support@fishcastapp.com.
''';
