import 'package:fish_caster/import_file.dart';
import 'package:fish_caster/screen/home_screen/tabs/help_tab/HelpTab.dart';
import 'package:fish_caster/screen/home_screen/tabs/home_tab/homeTab.dart';
import 'package:fish_caster/screen/home_screen/tabs/setting_tab/settginTab.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [Hometab(), HelpTab(), Container(), Settgintab()];

  final List<String> _icons = [
    ImgCons.homeIcon,
    ImgCons.helpIcon,
    ImgCons.shareIcon,
    ImgCons.settingIcon,
  ];

  final List<String> text = ["Home", "Help", "Share", "Setting"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 110,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF01274A),
              Color(0xFF00182E), // Deep blue, adjust as needed
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            bool isSelected = index == _selectedIndex;

            return GestureDetector(
              // onTap: () => setState(() => _selectedIndex = index),
              onTap: () async {
                if (index == 2) {
                  await Share.share("Check out Fish Caster App!");
                } else {
                  setState(() => _selectedIndex = index);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(isSelected ? ImgCons.bottomGlow : ""),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          _icons[index],
                          width: 28,
                          height: 28,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  CustomText(text: text[index], color: ClrCons.whiteColor),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
