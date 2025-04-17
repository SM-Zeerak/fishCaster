import 'package:fish_caster/import_file.dart';
import 'package:fish_caster/screen/home_screen/tabs/home_tab/sub_screen/score_detail_screen.dart';
import 'package:fish_caster/screen/home_screen/tabs/home_tab/sub_screen/select_location.dart';
import 'package:fish_caster/widgets/Buttons/custom_button_textfield.dart';
import 'package:flutter/material.dart';

class Hometab extends StatefulWidget {
  const Hometab({super.key});

  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  List<Map<String, dynamic>> data = [
    {
      'title': 'Today',
      'day1': "Morning",
      'day1Clr': Color(0xff565F27),
      'day1Score': '88',
      'day2': "Mid day",
      'day2Clr': Color(0xffBA6E12),
      'day2Score': '58',
      'day3': "Evening",
      'day3Clr': Color(0xff87132C),
      'day3Score': '24',
    },
    {
      'title': 'Sat 05/19',
      'day1': "Morning",
      'day1Clr': Color(0xffBA6E12),
      'day1Score': '44',
      'day2': "Mid day",
      'day2Clr': Color(0xffBA6E12),
      'day2Score': '60',
      'day3': "Evening",
      'day3Clr': Color(0xffBA6E12),
      'day3Score': '62',
    },
    {
      'title': 'Fri 05/18',
      'day1': "Morning",
      'day1Clr': Color(0xff87132C),
      'day1Score': '24',
      'day2': "Mid day",
      'day2Clr': Color(0xffBA6E12),
      'day2Score': '38',
      'day3': "Evening",
      'day3Clr': Color(0xffBA6E12),
      'day3Score': '44',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 0), // for status bar spacing
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ), // Optional inner padding
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImgCons.profile),
                            fit: BoxFit.contain,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImgCons.name_logo),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImgCons.notificationIcon),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.white.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ),

      body: ThemedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: SizeCons.getWidth(context) * 0.9,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        final selectedLocation = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectLocationScreen(),
                          ),
                        );

                        if (selectedLocation != null) {
                          print("Selected Location: $selectedLocation");
                          // You can store it or update your state here
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButtonTextField(
                            child: Center(
                              child: CustomText(text: 'Location', fontSize: 16),
                            ),
                            width: SizeCons.getWidth(context) * 0.7,
                            height: 50,
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(ImgCons.locationIcon),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomButtonTextField(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Select Criteria',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 28,
                              color: ClrCons.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                border: Border.all(color: ClrCons.whiteColor),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset(ImgCons.fireIcon),
                              ),
                            ),
                            SizedBox(width: 5),
                            CustomText(text: 'Hot Fishing', fontSize: 16),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(text: 'Create Criteria', fontSize: 16),
                            SizedBox(width: 5),

                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                border: Border.all(color: ClrCons.whiteColor),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.add,
                                color: ClrCons.whiteColor,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    CustomButtonTextField(
                      width: SizeCons.getWidth(context) * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Current',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            scoreWidget(
                              score: '55',
                              color: Color(0xffBA6E12),
                              ontap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            child: Column(
                              children: [
                                CustomText(
                                  text: data[index]['title'],
                                  fontSize: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: SizeCons.getWidth(context) * 0.3,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ClrCons.whiteColor,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomText(
                                            text: data[index]['day1'],
                                            fontSize: 20,
                                          ),
                                          scoreWidget(
                                            score: data[index]['day1Score'],
                                            color: data[index]['day1Clr'],
                                            ontap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (
                                                        context,
                                                      ) => ScoreDetailScreen(
                                                        title:
                                                            data[index]['title'],
                                                        score:
                                                            data[index]['day1Score'],
                                                        color:
                                                            data[index]['day1Clr'],
                                                        day:
                                                            data[index]['day1'],
                                                      ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: SizeCons.getWidth(context) * 0.3,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: ClrCons.whiteColor,
                                          ),
                                          top: BorderSide(
                                            color: ClrCons.whiteColor,
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomText(
                                            text: data[index]['day2'],
                                            fontSize: 20,
                                          ),
                                          scoreWidget(
                                            score: data[index]['day2Score'],
                                            color: data[index]['day2Clr'],
                                            ontap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (
                                                        context,
                                                      ) => ScoreDetailScreen(
                                                        title:
                                                            data[index]['title'],
                                                        score:
                                                            data[index]['day2Score'],
                                                        color:
                                                            data[index]['day2Clr'],
                                                        day:
                                                            data[index]['day2'],
                                                      ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: SizeCons.getWidth(context) * 0.3,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ClrCons.whiteColor,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomText(
                                            text: data[index]['day3'],
                                            fontSize: 20,
                                          ),
                                          scoreWidget(
                                            score: data[index]['day3Score'],
                                            color: data[index]['day3Clr'],
                                            ontap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (
                                                        context,
                                                      ) => ScoreDetailScreen(
                                                        title:
                                                            data[index]['title'],
                                                        day:
                                                            data[index]['day3'],
                                                        score:
                                                            data[index]['day3Score'],
                                                        color:
                                                            data[index]['day3Clr'],
                                                      ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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

class scoreWidget extends StatelessWidget {
  final String score;
  final Color color;
  final Function() ontap;
  const scoreWidget({
    super.key,
    required this.score,
    required this.color,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(child: CustomText(text: score, fontSize: 20)),
      ),
    );
  }
}
