import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/component/detail_card.dart';
import 'package:readmore/readmore.dart';

import '../ressouces/my_colors.dart';

class CultureDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    dynamic routes = ModalRoute.of(context)?.settings.arguments ;

    return Scaffold(
        body: Stack(
      children: [
        Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.32,
                decoration: BoxDecoration(color: MyColors.primaryColor),
              ),
            ),
            Positioned(
                top:-20,
                left: screenWidth * 0.5 - 403 / 2,
                child: SizedBox(
                    width: 403,
                    height: 381,
                    child: Image.asset(routes["image"]))),
          ],
        ),
        Positioned(
          top: screenHeight * 0.30,
          child: Container(
            height: screenHeight * 0.70,
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  //    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                     width: screenWidth * 0.74,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(routes["name"],
                                style: GoogleFonts.roboto(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ]),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                   //   width: screenWidth*0.74,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        DetailsCard(
                          icons: Icons.calendar_month_rounded,
                          title: 'Month',
                          value: routes["momth"],
                        ),
                        DetailsCard(
                            icons: Icons.water_drop_outlined,
                            title: 'water',
                            value: '${routes["water"]}L'),

                      ]),
                    ),
                    SizedBox(
                   //   width: screenWidth*0.64,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [

                            DetailsCard(
                                icons: Icons.thermostat, title: 'Temp', value: '${routes["temp"]} C'),
                            DetailsCard(
                                icons: Icons.light_mode,
                                title: 'Light',
                                value: '${routes['light']} H')
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: screenWidth * 0.74,
                      child: ReadMoreText(
    "${routes["text"]}"
                       ,
                          trimLines: 10,
                          colorClickableText: Colors.blue,
                          trimMode: TrimMode.Line,

                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
