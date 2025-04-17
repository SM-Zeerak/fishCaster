// import 'package:fish_caster/import_file.dart';
// import 'package:fish_caster/screen/home_screen/tabs/home_tab/homeTab.dart';
// import 'package:fish_caster/widgets/Buttons/custom_button_textfield.dart';
// import 'package:flutter/material.dart';

// class ScoreDetailScreen extends StatefulWidget {
//   final String title;
//   final String day;
//   final String score;
//   final Color color;
//   const ScoreDetailScreen({
//     super.key,
//     required this.title,
//     required this.score,
//     required this.color,
//     required this.day,
//   });

//   @override
//   State<ScoreDetailScreen> createState() => _ScoreDetailScreenState();
// }

// class _ScoreDetailScreenState extends State<ScoreDetailScreen> {
//   TextEditingController oldPassController = TextEditingController();
//   TextEditingController newPassController = TextEditingController();
//   TextEditingController confirmPassController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back_ios, color: Colors.white),
//         ),
//       ),
//       body: ThemedBackground(
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Center(
//               child: Container(
//                 width: SizeCons.getWidth(context) * 0.92,
//                 child: Column(
//                   children: [
//                     SizedBox(height: 20),
//                     CustomText(text: widget.title, fontSize: 20),
//                     CustomButtonTextField(
//                       width: SizeCons.getWidth(context) * 0.5,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CustomText(
//                               text: widget.day,
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             scoreWidget(
//                               score: widget.score,
//                               color: widget.color,
//                               ontap: () {},
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     CustomButtonTextField(
//                       width: double.infinity,
//                       height: 450,
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Table(
//                               columnWidths: const {
//                                 0: FlexColumnWidth(2),
//                                 1: FlexColumnWidth(2),
//                                 2: FlexColumnWidth(2),
//                                 3: FlexColumnWidth(1.5),
//                               },
//                               border: TableBorder.symmetric(
//                                 inside: BorderSide(color: Colors.white24),
//                               ),
//                               children: [
//                                 _buildTableRow([
//                                   'Variables',
//                                   'Preference',
//                                   'Forecasted',
//                                   'Points',
//                                 ], isHeader: true),
//                                 _buildTableRow([
//                                   'Temperature',
//                                   '65°F - 75°F',
//                                   '72°F',
//                                   '2',
//                                 ]),
//                                 _buildTableRow([
//                                   'Barometric Pressure',
//                                   '29.8 - 30.15',
//                                   '30 inHG',
//                                   '1',
//                                 ]),
//                                 _buildTableRow([
//                                   'Clouds',
//                                   '50 - 84',
//                                   '60',
//                                   '1',
//                                 ]),
//                                 _buildTableRow([
//                                   'Wind',
//                                   '0 - 3 mph',
//                                   '2 mph',
//                                   '2',
//                                 ]),
//                                 _buildTableRow([
//                                   'Precipitation',
//                                   '<10%',
//                                   '7%',
//                                   '1',
//                                 ]),
//                                 _buildTableRow([
//                                   'Thunder storms',
//                                   '200 - 233',
//                                   '225',
//                                   '-4',
//                                 ]),
//                                 _buildTableRow(['UV Index', '0 - 3', '2', '2']),
//                                 _buildTableRow([
//                                   'New moon',
//                                   '0 - 0.25',
//                                   '0.25',
//                                   '1',
//                                 ]),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
//     return TableRow(
//       children:
//           cells.map((cell) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 10.0,
//                 horizontal: 5,
//               ),
//               child: Text(
//                 cell,
//                 style: TextStyle(
//                   fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
//                   fontSize: isHeader ? 15 : 13,
//                   color: Colors.white,
//                 ),
//               ),
//             );
//           }).toList(),
//     );
//   }
// }

import 'package:fish_caster/screen/home_screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:fish_caster/import_file.dart';
import 'package:fish_caster/screen/home_screen/tabs/home_tab/homeTab.dart';
import 'package:fish_caster/widgets/Buttons/custom_button_textfield.dart';

class ScoreDetailScreen extends StatefulWidget {
  final String title;
  final String day;
  final String score;
  final Color color;

  const ScoreDetailScreen({
    super.key,
    required this.title,
    required this.score,
    required this.color,
    required this.day,
  });

  @override
  State<ScoreDetailScreen> createState() => _ScoreDetailScreenState();
}

class _ScoreDetailScreenState extends State<ScoreDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: ThemedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 700), // Tablet support
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: widget.title,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 20),
                    CustomButtonTextField(
                      width: screenWidth * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: CustomText(
                                text: widget.day,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            scoreWidget(
                              score: widget.score,
                              color: widget.color,
                              ontap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButtonTextField(
                      width: screenWidth * 0.9,
                      height: 450,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Table(
                            //   columnWidths: const {
                            //     0: FlexColumnWidth(2),
                            //     1: FlexColumnWidth(2),
                            //     2: FlexColumnWidth(2),
                            //     3: FlexColumnWidth(1.5),
                            //   },
                            //   border: TableBorder.symmetric(
                            //     inside: BorderSide(color: Colors.white24),
                            //   ),
                            //   children: [
                            //     _buildTableRow([
                            //       'Variables',
                            //       'Preference',
                            //       'Forecasted',
                            //       'Points',
                            //     ], isHeader: true),
                            //     _buildTableRow([
                            //       'Temperature',
                            //       '65°F - 75°F',
                            //       '72°F',
                            //       '2',
                            //     ]),
                            //     _buildTableRow([
                            //       'Barometric Pressure',
                            //       '29.8 - 30.15',
                            //       '30 inHG',
                            //       '1',
                            //     ]),
                            //     _buildTableRow([
                            //       'Clouds',
                            //       '50 - 84',
                            //       '60',
                            //       '1',
                            //     ]),
                            //     _buildTableRow([
                            //       'Wind',
                            //       '0 - 3 mph',
                            //       '2 mph',
                            //       '2',
                            //     ]),
                            //     _buildTableRow([
                            //       'Precipitation',
                            //       '<10%',
                            //       '7%',
                            //       '1',
                            //     ]),
                            //     _buildTableRow([
                            //       'Thunder storms',
                            //       '200 - 233',
                            //       '225',
                            //       '-4',
                            //     ]),
                            //     _buildTableRow(['UV Index', '0 - 3', '2', '2']),
                            //     _buildTableRow([
                            //       'New moon',
                            //       '0 - 0.25',
                            //       '0.25',
                            //       '1',
                            //     ]),
                            //   ],
                            // ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 100,
                                ), // Adjust for preferred table width
                                child: Table(
                                  columnWidths: const {
                                    0: FixedColumnWidth(100),
                                    1: FixedColumnWidth(100),
                                    2: FixedColumnWidth(100),
                                    3: FixedColumnWidth(100),
                                  },
                                  border: TableBorder.symmetric(
                                    inside: BorderSide(color: Colors.white24),
                                  ),
                                  children: [
                                    _buildTableRow([
                                      'Variables',
                                      'Preference',
                                      'Forecasted',
                                      'Points',
                                    ], isHeader: true),
                                    _buildTableRow([
                                      'Temperature',
                                      '65°F - 75°F',
                                      '72°F',
                                      '2',
                                    ]),
                                    _buildTableRow([
                                      'Barometric Pressure',
                                      '29.8 - 30.15',
                                      '30 inHG',
                                      '1',
                                    ]),
                                    _buildTableRow([
                                      'Clouds',
                                      '50 - 84',
                                      '60',
                                      '1',
                                    ]),
                                    _buildTableRow([
                                      'Wind',
                                      '0 - 3 mph',
                                      '2 mph',
                                      '2',
                                    ]),
                                    _buildTableRow([
                                      'Precipitation',
                                      '<10%',
                                      '7%',
                                      '1',
                                    ]),
                                    _buildTableRow([
                                      'Thunder storms',
                                      '200 - 233',
                                      '225',
                                      '-4',
                                    ]),
                                    _buildTableRow([
                                      'UV Index',
                                      '0 - 3',
                                      '2',
                                      '2',
                                    ]),
                                    _buildTableRow([
                                      'New moon',
                                      '0 - 0.25',
                                      '0.25',
                                      '1',
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children:
          cells.map((cell) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 5,
              ),
              child: Text(
                cell,
                style: TextStyle(
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                  fontSize: isHeader ? 15 : 13,
                  color: Colors.white,
                ),
              ),
            );
          }).toList(),
    );
  }
}
