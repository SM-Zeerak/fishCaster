import 'package:fish_caster/core/color_cons.dart';
import 'package:fish_caster/widgets/Theme/themedBackground.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
                _privacyPolicy,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: ClrCons.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const String _privacyPolicy = '''
**Privacy Policy**

Effective Date: April 18, 2025

This Privacy Policy explains how we collect, use, and protect your information when you use our weather forecasting application designed primarily for fishers.

**1. Information We Collect**
- **Location Data:** We collect location data to provide accurate and real-time weather, water conditions, wind speed, and forecasts for your area.
- **Usage Data:** We may collect anonymous data regarding how you use the app to improve performance and features.
- **Optional Information:** You may optionally provide preferences or favorite fishing zones.

**2. How We Use Your Information**
- To provide accurate weather, wind, and marine forecasts for fishing activities.
- To improve our services, features, and user experience.
- To notify users of significant weather changes or dangerous conditions.

**3. Data Sharing**
- We do not share your personal data with third parties.
- We may share anonymized aggregate data for research and performance analysis.

**4. Security**
- We implement security measures to protect your data but cannot guarantee 100% safety over the internet.

**5. Your Consent**
By using the app, you consent to our privacy policy.

**6. Changes to This Policy**
We may update this policy from time to time. Continued use of the app means you agree to the updated terms.

If you have questions or concerns, contact us at support@fishcastapp.com.
''';
