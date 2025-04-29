import 'package:fish_caster/api_services/auth_service/auth_service.dart';
import 'package:fish_caster/bloc/share_prefrences/user_shared/user_shared_helper.dart';
import 'package:fish_caster/import_file.dart';
import 'package:fish_caster/screen/auth_screen/loginScreen.dart';
import 'package:fish_caster/screen/home_screen/tabs/setting_tab/sub_screens/notification_screen.dart';
import 'package:fish_caster/screen/home_screen/tabs/setting_tab/sub_screens/prefrences_screen.dart';
import 'package:fish_caster/screen/home_screen/tabs/setting_tab/sub_screens/privacy_policy.dart';
import 'package:fish_caster/screen/home_screen/tabs/setting_tab/sub_screens/privacy_setting/changePassScreen.dart';
import 'package:fish_caster/screen/home_screen/tabs/setting_tab/sub_screens/profile/profile_setting.dart';
import 'package:fish_caster/screen/home_screen/tabs/setting_tab/sub_screens/term_condition.dart';
import 'package:fish_caster/widgets/Buttons/custom_button_textfield.dart';
import 'package:fish_caster/widgets/Theme/themedBackground.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settgintab extends StatefulWidget {
  const Settgintab({super.key});

  @override
  State<Settgintab> createState() => _SettgintabState();
}

class _SettgintabState extends State<Settgintab> {
  @override
  Widget build(BuildContext context) {
    void showBottomDialogue(BuildContext context) async {
      showModalBottomSheet(
        backgroundColor: ClrCons.surfaceClr,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                ListTile(
                  title: CustomText(text: 'English', color: ClrCons.whiteColor),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: CustomText(text: 'German', color: ClrCons.whiteColor),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: CustomText(text: 'Arabic', color: ClrCons.whiteColor),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }

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
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationScreen()),
          );
        },
      },
      {
        'title': 'Preferences',
        'icon': ImgCons.prefIcon,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PreferencesScreen()),
          );
        },
      },
      {
        'title': 'Language',
        'icon': ImgCons.langIcon,
        'onTap': () {
          showBottomDialogue(context);
        },
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
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
          );
        },
      },
      {
        'title': 'Terms & Conditions',
        'icon': ImgCons.termIcon,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TermsConditionsScreen()),
          );
        },
      },
      {
        'title': 'Logout',
        'icon': ImgCons.termIcon,
        'onTap': () async {
          final prefs = await SharedPreferences.getInstance();

          String sharedRefreshToken = prefs.getString('refreshToken') ?? "";

          final response = AuthService.logoutService(
            refreshToken: sharedRefreshToken,
          );
          if (response != null) {
            globalSnack.showSnackBar(context, "Logout Successfully");
            clearSharedPreferencesAndLogout(context);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Loginscreen()),
              (route) => false,
            );
          } else {
            globalSnack.showSnackBar(context, "Failed To Logout");
          }
        },
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
