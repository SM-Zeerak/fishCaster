import 'package:fish_caster/import_file.dart';
import 'package:fish_caster/screen/home_screen/tabs/setting_tab/sub_screens/privacy_setting/changePassScreen.dart';
import 'package:fish_caster/screen/home_screen/tabs/setting_tab/sub_screens/profile/profile_setting.dart';
import 'package:fish_caster/widgets/Buttons/custom_button_textfield.dart';
import 'package:fish_caster/widgets/Theme/themedBackground.dart';
import 'package:flutter/material.dart';

class Settgintab extends StatefulWidget {
  const Settgintab({super.key});

  @override
  State<Settgintab> createState() => _SettgintabState();
}

class _SettgintabState extends State<Settgintab> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> settingItems = [
      {
        'title': 'Profile',
        'icon': ImgCons.profileIcon,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileSettingScreen()),
          );
        },
      },
      {
        'title': 'Notifications',
        'icon': ImgCons.notiIcon,
        'onTap': () => print('Notifications tapped'),
      },
      {
        'title': 'Preferences',
        'icon': ImgCons.prefIcon,
        'onTap': () => print('Privacy tapped'),
      },
      {
        'title': 'Language',
        'icon': ImgCons.langIcon,
        'onTap': () => print('Language tapped'),
      },
      {
        'title': 'Privacy Settings',
        'icon': ImgCons.privacySettingIcon,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangePassScreen()),
          );
        },
      },
      {
        'title': 'Privacy Policy',
        'icon': ImgCons.policyIcon,
        'onTap': () => print('Help tapped'),
      },
      {
        'title': 'Terms & Conditions',
        'icon': ImgCons.termIcon,
        'onTap': () => print('Logout tapped'),
      },
    ];
    return Scaffold(
      body: ThemedBackground(
        child: SafeArea(
          child: Center(
            child: Container(
              width: SizeCons.getWidth(context) * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const CustomText(
                      text: 'Settings',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 30),
                    ...settingItems.map((item) {
                      return GestureDetector(
                        onTap: item['onTap'],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: CustomButtonTextField(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: item['title'],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Image.asset(
                                    item['icon'],
                                    width: 26,
                                    height: 26,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
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
