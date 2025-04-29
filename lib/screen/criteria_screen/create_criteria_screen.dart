import 'package:fish_caster/import_file.dart';
import 'package:fish_caster/screen/home_screen/tabs/home_tab/homeTab.dart';
import 'package:fish_caster/widgets/Buttons/custom_button_textfield.dart';
import 'package:flutter/material.dart';

class CreateCriteriaScreen extends StatefulWidget {
  const CreateCriteriaScreen({super.key});

  @override
  State<CreateCriteriaScreen> createState() => _CreateCriteriaScreenState();
}

class _CreateCriteriaScreenState extends State<CreateCriteriaScreen> {
  final TextEditingController _nameController = TextEditingController();

  int selectedTimeOfDay = -1;
  int selectedTempIndex = -1;
  int selectedBioIndex = -1;
  int selectedWindsIndex = -1;
  int selectedPercipitationIndex = -1;

  int selectedBioSubTrendIndex = -1;
  int selectedBioSubIndex = -1;

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
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: SizeCons.getWidth(context) * 0.85,

                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CustomText(
                      text: "Create Criteria",
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: SizeCons.getWidth(context) * 0.7,
                      child: CustomTextField(
                        controller: _nameController,
                        hintText: 'Enter criteria Name',
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomButtonTextField(
                      // height: 100,
                      isHeight: true,

                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(ImgCons.sunIcon),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(ImgCons.darkIcon),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomText(text: 'Time of day', fontSize: 20),
                                  Container(width: 30, height: 30),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomCheckBoxList(
                                    onChanged: (index) {
                                      setState(() {
                                        selectedTimeOfDay = index;
                                      });
                                    },
                                    labels: [
                                      CustomText(text: 'Morning'),
                                      CustomText(
                                        text: 'Late morning - Early afternoon',
                                      ),
                                      CustomText(
                                        text: 'Late afternoon - Evening',
                                      ),
                                    ],
                                    isRadio: true,
                                  ),
                                ],
                              ),
                              if (selectedTimeOfDay == 0 ||
                                  selectedTimeOfDay == 1 ||
                                  selectedTimeOfDay == 2)
                                CustomCheckBoxList(
                                  labels: [
                                    CustomText(text: '1pt'),
                                    CustomText(text: '2pts'),
                                    CustomText(text: '3pts'),
                                    CustomText(
                                      text:
                                          'Automatic red period (safety alert)',
                                    ),
                                  ],
                                  isRadio: true,
                                  isRow: true,
                                  isRound: true,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Temperature
                    CustomButtonTextField(
                      // height: 400,
                      isHeight: true,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(ImgCons.tempIcon),
                                      ),
                                    ),
                                  ),
                                  CustomText(text: 'Temperature', fontSize: 20),
                                  Container(width: 20, height: 20),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomCheckBoxList(
                                    // isRow: true,
                                    isRadio: true,
                                    onChanged: (index) {
                                      setState(() {
                                        selectedTempIndex = index;
                                      });
                                    },
                                    labels: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: 'Temperature range',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          SizedBox(height: 20),
                                          if (selectedTempIndex == 0)
                                            TemperatureRangeSlider(),
                                          if (selectedTempIndex == 0)
                                            Container(
                                              width:
                                                  SizeCons.getWidth(context) *
                                                  0.65,
                                              child: CustomCheckBoxList(
                                                labels: [
                                                  CustomText(text: '1pt'),
                                                  CustomText(text: '2pts'),
                                                  CustomText(text: '3pts'),
                                                  CustomText(
                                                    text:
                                                        'Automatic red period (safety alert)',
                                                  ),
                                                ],
                                                isRadio: true,
                                                isRow: true,
                                                isRound: true,
                                              ),
                                            ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: 'Temperature trend',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(height: 20),
                                          if (selectedTempIndex == 1)
                                            Container(
                                              width:
                                                  SizeCons.getWidth(context) *
                                                  0.67,
                                              child: CustomCheckBoxList(
                                                labels: [
                                                  CustomText(text: 'Warming'),
                                                  CustomText(text: 'Cooling'),
                                                  CustomText(text: 'Steady'),
                                                ],
                                                isRadio: true,
                                                isRow: true,
                                                isRound: true,
                                              ),
                                            ),
                                          if (selectedTempIndex == 1)
                                            Container(
                                              width:
                                                  SizeCons.getWidth(context) *
                                                  0.65,
                                              child: CustomCheckBoxList(
                                                labels: [
                                                  CustomText(text: '1pt'),
                                                  CustomText(text: '2pts'),
                                                  CustomText(text: '3pts'),
                                                  CustomText(
                                                    text:
                                                        'Automatic red period (safety alert)',
                                                  ),
                                                ],
                                                isRadio: true,
                                                isRow: true,
                                                isRound: true,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Barometric
                    CustomButtonTextField(
                      // height: 400,
                      isHeight: true,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(ImgCons.pressureIcon),
                                      ),
                                    ),
                                  ),
                                  CustomText(
                                    text: 'Barometric Pressure',
                                    fontSize: 20,
                                  ),
                                  Container(width: 20, height: 20),
                                ],
                              ),
                              SizedBox(height: 20),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomCheckBoxList(
                                    onChanged: (index) {
                                      setState(() {
                                        selectedBioIndex = index;
                                      });
                                    },
                                    labels: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: 'Barometric Pressure',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          SizedBox(height: 10),
                                          if (selectedBioIndex == 0)
                                            CustomCheckBoxList(
                                              isRound: true,
                                              isRadio: true,
                                              onChanged: (index) {
                                                setState(() {
                                                  selectedBioSubIndex = index;
                                                });
                                              },
                                              labels: [
                                                SizedBox(
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'High = ',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors
                                                                    .white, // Customize as needed
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: '≥30.2 inHg',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Normal= ',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors
                                                                    .white, // Customize as needed
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              '29.8- 30.15 inHg',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Low= ',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors
                                                                    .white, // Customize as needed
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: '≤29.7',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          if (selectedBioIndex == 0 &&
                                              (selectedBioSubIndex == 0 ||
                                                  selectedBioSubIndex == 1 ||
                                                  selectedBioSubIndex == 2))
                                            Column(
                                              children: [
                                                SizedBox(height: 10),
                                                Container(
                                                  height: 1,
                                                  width:
                                                      SizeCons.getWidth(
                                                        context,
                                                      ) *
                                                      0.6,
                                                  color: Colors.grey[400]!,
                                                ),
                                                SizedBox(height: 10),
                                                SizedBox(
                                                  width:
                                                      SizeCons.getWidth(
                                                        context,
                                                      ) *
                                                      0.65,
                                                  child: CustomCheckBoxList(
                                                    labels: [
                                                      CustomText(text: '1pt'),
                                                      CustomText(text: '2pts'),
                                                      CustomText(text: '3pts'),
                                                      CustomText(
                                                        text:
                                                            'Automatic red period (safety alert)',
                                                      ),
                                                    ],
                                                    isRadio: true,
                                                    isRow: true,
                                                    isRound: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: 'Barometric Trend',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          SizedBox(height: 10),
                                          if (selectedBioIndex == 1)
                                            CustomCheckBoxList(
                                              isRound: true,
                                              isRow: true,
                                              isRadio: true,
                                              onChanged: (int index) {
                                                setState(() {
                                                  selectedBioSubTrendIndex =
                                                      index;
                                                });
                                              },
                                              labels: [
                                                CustomText(
                                                  text: 'Rising',
                                                  color:
                                                      Colors
                                                          .white, // Customize as needed
                                                  fontSize: 14,
                                                ),
                                                CustomText(
                                                  text: 'Falling',
                                                  color:
                                                      Colors
                                                          .white, // Customize as needed
                                                  fontSize: 14,
                                                ),
                                                CustomText(
                                                  text: 'Steady',
                                                  color:
                                                      Colors
                                                          .white, // Customize as needed
                                                  fontSize: 14,
                                                ),
                                              ],
                                            ),

                                          if (selectedBioIndex == 1 &&
                                              (selectedBioSubTrendIndex == 0 ||
                                                  selectedBioSubTrendIndex ==
                                                      1 ||
                                                  selectedBioSubTrendIndex ==
                                                      2))
                                            Column(
                                              children: [
                                                SizedBox(height: 10),
                                                Container(
                                                  height: 1,
                                                  width:
                                                      SizeCons.getWidth(
                                                        context,
                                                      ) *
                                                      0.6,
                                                  color: Colors.grey[400]!,
                                                ),
                                                SizedBox(height: 10),
                                                SizedBox(
                                                  width:
                                                      SizeCons.getWidth(
                                                        context,
                                                      ) *
                                                      0.65,
                                                  child: CustomCheckBoxList(
                                                    labels: [
                                                      CustomText(text: '1pt'),
                                                      CustomText(text: '2pts'),
                                                      CustomText(text: '3pts'),
                                                      CustomText(
                                                        text:
                                                            'Automatic red period (safety alert)',
                                                      ),
                                                    ],
                                                    isRadio: true,
                                                    isRow: true,
                                                    isRound: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ],
                                    isRadio: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Clouds
                    CustomButtonTextField(
                      width: SizeCons.getWidth(context) * 0.8,
                      // height: 400,
                      isHeight: true,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(ImgCons.cloudIcon),
                                      ),
                                    ),
                                  ),
                                  CustomText(text: 'Clouds', fontSize: 20),
                                  Container(width: 20, height: 20),
                                ],
                              ),
                              SizedBox(height: 20),
                              CustomText(
                                text: 'Cloud Cover',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                              SizedBox(height: 20),
                              TemperatureRangeSlider(
                                min: 0,
                                max: 100,
                                unit: '%',
                                initialRange: RangeValues(20, 80),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Winds
                    CustomButtonTextField(
                      // width: SizeCons.getWidth(context) * 0.8,
                      // height: 400,
                      isHeight: true,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(ImgCons.windIcon),
                                      ),
                                    ),
                                  ),
                                  CustomText(text: 'Winds', fontSize: 20),
                                  Container(width: 20, height: 20),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomCheckBoxList(
                                    isRadio: true,
                                    onChanged: (index) {
                                      setState(() {
                                        selectedWindsIndex = index;
                                      });
                                    },
                                    labels: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: 'Winds Speed Range',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          SizedBox(height: 20),
                                          if (selectedWindsIndex == 0)
                                            TemperatureRangeSlider(
                                              min: 0,
                                              max: 120,
                                              unit: 'mph',
                                              initialRange: RangeValues(15, 75),
                                              onChanged: (range) {
                                                print(
                                                  'Wind speed: ${range.start} to ${range.end} mph',
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: 'Winds Speed Trend',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          SizedBox(height: 10),
                                          if (selectedWindsIndex == 1)
                                            Row(
                                              children: [
                                                CustomCheckBoxList(
                                                  isRound: true,
                                                  isRadio: true,
                                                  labels: [
                                                    CustomText(
                                                      text: 'Calm (0-3 mph)',
                                                      fontSize: 14,
                                                    ),
                                                    CustomText(
                                                      text: 'Light (4-10 mph)',
                                                      fontSize: 14,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          'Moderate (11-19 mph)',
                                                      fontSize: 14,
                                                    ),
                                                    CustomText(
                                                      text: 'Strong (>20 mph)',
                                                      fontSize: 14,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Percipitation
                    CustomButtonTextField(
                      // height: 400,
                      isHeight: true,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          ImgCons.percipitationIcon,
                                        ),
                                      ),
                                    ),
                                  ),
                                  CustomText(
                                    text: 'Percipitation',
                                    fontSize: 20,
                                  ),
                                  Container(width: 20, height: 20),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomCheckBoxList(
                                    isRadio: true,
                                    onChanged: (index) {
                                      setState(() {
                                        selectedPercipitationIndex = index;
                                      });
                                    },
                                    labels: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: 'Percipitation Range',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          SizedBox(height: 20),
                                          if (selectedPercipitationIndex == 0)
                                            TemperatureRangeSlider(
                                              min: 0,
                                              max: 100,
                                              unit: '%',
                                              initialRange: RangeValues(30, 70),
                                            ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: 'Percipitation Trend',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          SizedBox(height: 10),
                                          if (selectedPercipitationIndex == 1)
                                            Row(
                                              children: [
                                                CustomCheckBoxList(
                                                  isRound: true,
                                                  isRadio: true,
                                                  labels: [
                                                    CustomText(
                                                      text:
                                                          'Little chance (<10%)',
                                                      fontSize: 14,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          'Slight chance (10%-30%)',
                                                      fontSize: 14,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          'Moderate chance (31%-60%)',
                                                      fontSize: 14,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          'High chance (61%-100%)',
                                                      fontSize: 14,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    // Thunderstorms
                    CustomButtonTextField(
                      // height: 400,
                      isHeight: true,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(ImgCons.thunderIcon),
                                      ),
                                    ),
                                  ),
                                  CustomText(
                                    text: 'Thunderstorms',
                                    fontSize: 20,
                                  ),
                                  Container(width: 20, height: 20),
                                ],
                              ),

                              SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomCheckBoxList(
                                    isRadio: true,
                                    labels: [
                                      Column(
                                        children: [
                                          Column(
                                            children: [
                                              CustomText(
                                                text: 'Thunderstorms predicted for the period.',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              SizedBox(height: 5),
                                              // Padding(
                                              //   padding: EdgeInsets.only(
                                              //     right:
                                              //         SizeCons.getWidth(context) *
                                              //         0.08,
                                              //   ),
                                              //   child: Container(
                                              //     width: 50,
                                              //     height: 50,
                                              //     decoration: BoxDecoration(
                                              //       border: Border.all(
                                              //         width: 1,
                                              //         color: ClrCons.whiteColor,
                                              //       ),
                                              //       borderRadius:
                                              //           BorderRadius.circular(10),
                                              //     ),
                                              //     child: Center(
                                              //       child: CustomText(text: '200'),
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                  
                                      Column(
                                        children: [
                                          CustomText(
                                            text: 'Thunderstorms predicted the next day.',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(height: 5),
                                          // Container(
                                          //   width: 50,
                                          //   height: 50,
                                          //   decoration: BoxDecoration(
                                          //     border: Border.all(
                                          //       width: 1,
                                          //       color: ClrCons.whiteColor,
                                          //     ),
                                          //     borderRadius: BorderRadius.circular(
                                          //       10,
                                          //     ),
                                          //   ),
                                          //   child: Center(
                                          //     child: CustomText(text: ''),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // UV
                    CustomButtonTextField(
                      // height: 400,
                      isHeight: true,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(ImgCons.uvIcon),
                                      ),
                                    ),
                                  ),
                                  CustomText(text: 'UV index', fontSize: 20),
                                  Container(width: 20, height: 20),
                                ],
                              ),
                              SizedBox(height: 20),
                              CustomText(
                                text: 'UV index',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                              SizedBox(height: 20),
                              TemperatureRangeSlider(
                                min: 0,
                                max: 100,
                                unit: '%',
                                initialRange: RangeValues(0, 100),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Moon influence
                    CustomButtonTextField(
                      width: SizeCons.getWidth(context) * 0.8,
                      // height: 400,
                      isHeight: true,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(ImgCons.solunarIcon),
                                      ),
                                    ),
                                  ),
                                  CustomText(
                                    text: 'Moon influence',
                                    fontSize: 20,
                                  ),
                                  Container(width: 20, height: 20),
                                ],
                              ),
                              SizedBox(height: 20),
                              CustomText(
                                text: 'Periods',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  CustomCheckBoxList(
                                    labels: [
                                      CustomText(
                                        text: 'Feeding periods',
                                        fontSize: 14,
                                      ),
                                      CustomText(
                                        text: 'New moon',
                                        fontSize: 14,
                                      ),
                                      CustomText(
                                        text: 'Full moon',
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
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

class CustomCheckBoxList extends StatefulWidget {
  final List<Widget> labels; // Changed from List<String>
  final bool isRow;
  final bool isRadio;
  final double checkboxSize;
  final double fontSize;
  final bool isRound;
  final Function(int)? onChanged;
  final int initialSelectedIndex;

  const CustomCheckBoxList({
    super.key,
    required this.labels,
    this.isRow = false,
    this.isRadio = false,
    this.checkboxSize = 14,
    this.fontSize = 14,
    this.isRound = false,
    this.onChanged,
    this.initialSelectedIndex = -1,
  });

  @override
  State<CustomCheckBoxList> createState() => _CustomCheckBoxListState();
}

class _CustomCheckBoxListState extends State<CustomCheckBoxList> {
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = List.generate(widget.labels.length, (_) => false);
    if (widget.initialSelectedIndex >= 0 &&
        widget.initialSelectedIndex < widget.labels.length) {
      isSelected[widget.initialSelectedIndex] = true;
    }
  }

  void _onTap(int index) {
    setState(() {
      if (widget.isRadio) {
        for (int i = 0; i < isSelected.length; i++) {
          isSelected[i] = (i == index);
        }
        print('Selected radio index: $index');
      } else {
        isSelected[index] = !isSelected[index];
        print('Toggled checkbox index: $index (value: ${isSelected[index]})');
      }
    });

    if (widget.onChanged != null) {
      widget.onChanged!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isRow
        ? Container(
          alignment: Alignment.topLeft,
          child: Wrap(spacing: 12, children: _buildCheckBoxes()),
        )
        // Wrap(
        //   spacing: 12,
        //   // runSpacing: ,
        //   children: _buildCheckBoxes(),
        // )
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: _buildCheckBoxes())
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildCheckBoxes(),
        );
  }

  List<Widget> _buildCheckBoxes() {
    return List.generate(widget.labels.length, (index) {
      return GestureDetector(
        onTap: () => _onTap(index),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: widget.checkboxSize,
                height: widget.checkboxSize,
                decoration: BoxDecoration(
                  color:
                      isSelected[index]
                          ? (widget.isRound ? Colors.blue : Colors.white)
                          : Colors.transparent,
                  shape: widget.isRound ? BoxShape.circle : BoxShape.rectangle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                alignment: Alignment.center,
                child:
                    isSelected[index]
                        ? Icon(
                          Icons.check,
                          size: widget.checkboxSize / 1.5,
                          color: widget.isRound ? Colors.blue : Colors.black,
                        )
                        : null,
              ),
              const SizedBox(width: 8),
              widget
                  .labels[index], // <- now accepts any widget (text or custom)
            ],
          ),
        ),
      );
    });
  }
}

class TemperatureRangeSlider extends StatefulWidget {
  final double min;
  final double max;
  final String unit;
  final RangeValues? initialRange;
  final Function(RangeValues)? onChanged;

  const TemperatureRangeSlider({
    Key? key,
    this.min = -30,
    this.max = 120,
    this.unit = '°F',
    this.initialRange,
    this.onChanged,
  }) : super(key: key);

  @override
  _TemperatureRangeSliderState createState() => _TemperatureRangeSliderState();
}

class _TemperatureRangeSliderState extends State<TemperatureRangeSlider> {
  late RangeValues _currentRange;

  @override
  void initState() {
    super.initState();
    _currentRange = widget.initialRange ?? RangeValues(widget.min, widget.max);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeCons.getWidth(context) * 0.65,
      child: Column(
        children: [
          CustomText(
            text:
                '${_currentRange.start.toInt()}${widget.unit} - ${_currentRange.end.toInt()}${widget.unit}',
            fontSize: 14,
          ),
          const SizedBox(height: 10),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 2,
              rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
              rangeThumbShape: const RoundRangeSliderThumbShape(
                enabledThumbRadius: 8,
              ),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
            ),
            child: RangeSlider(
              values: _currentRange,
              min: widget.min,
              max: widget.max,
              divisions: (widget.max - widget.min).toInt(),
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.white,
              onChanged: (RangeValues values) {
                setState(() => _currentRange = values);
                widget.onChanged?.call(values);
              },
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.min.toInt()}${widget.unit}',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                '${widget.max.toInt()}${widget.unit}',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
