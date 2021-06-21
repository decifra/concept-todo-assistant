import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_concept_app/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:todo_concept_app/models/task.dart';

import '../dashed_line.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kLightPrimary,
      body: Stack(
        children: [
          SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60.0,
                    left: 30.0,
                  ),
                  child: Text(
                    "Hi Tien, \nWhat is your focus today?",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => {print("Activating....")},
                    child: Image.asset(
                      "assets/icons/assistant_icon@3x.png",
                      width: screenWidth * 0.4,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      viewportFraction: 0.4,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      initialPage: 1,
                    ),
                    items: getTasksSlider(screenHeight, screenWidth),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kTealAccent,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 3.0),
                                    blurRadius: 10.0,
                                    color: Color(0xff000000).withOpacity(0.16))
                              ]),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kTealAccent,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 3.0),
                                    blurRadius: 10.0,
                                    color: Color(0xff000000).withOpacity(0.16))
                              ]),
                        ),
                        Text(
                          "10",
                          style: GoogleFonts.montserrat(
                              color: kDarkPrimary,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    CustomPaint(
                      size: Size(screenWidth * 0.3, 5.0),
                      painter: DashedLinePainter(),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kTealAccent,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 3.0),
                                    blurRadius: 10.0,
                                    color: Color(0xff000000).withOpacity(0.16))
                              ]),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kTealAccent,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 3.0),
                                    blurRadius: 10.0,
                                    color: Color(0xff000000).withOpacity(0.16))
                              ]),
                        ),
                        Text(
                          "15",
                          style: GoogleFonts.montserrat(
                              color: kDarkPrimary,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: -10,
            child: SizedBox(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  SvgPicture.asset(
                    "assets/icons/list-interface-symbol.svg",
                    height: 30.0,
                    color: kDarkPrimary,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/selected_bg.svg"),
                      SvgPicture.asset(
                        "assets/icons/home_menu.svg",
                        height: 40.0,
                        color: kDarkPrimary,
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    "assets/icons/profile_menu.svg",
                    height: 30.0,
                    color: kDarkPrimary,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

getTasksSlider(double height, double width) {
  List<Widget> tasksSlider;

  return tasksSlider = tasks
      .map(
        (item) => SizedBox(
          height: height / 5,
          width: width * 0.35,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: kGreenGradient),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  item.iconPath,
                  width: 30,
                  height: 30,
                  color: kTealPrimary,
                ),
                Text(
                  DateFormat.MMMEd().format(item.date),
                  style: TextStyle(color: kTealPrimary, fontFamily: "Industry"),
                ),
                Text(
                  item.title,
                  style: GoogleFonts.montserrat(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: kLightPrimary),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                )
              ],
            ),
          ),
        ),
      )
      .toList();
}
