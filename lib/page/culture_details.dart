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
                    child: Image.asset('assets/an.png'))),
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
                            Text("Ananas",
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
                          value: 'January',
                        ),
                        DetailsCard(
                            icons: Icons.water_drop_outlined,
                            title: 'water',
                            value: '20L'),

                      ]),
                    ),
                    SizedBox(
                   //   width: screenWidth*0.64,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [

                            DetailsCard(
                                icons: Icons.thermostat, title: 'Temp', value: '32 C'),
                            DetailsCard(
                                icons: Icons.light_mode,
                                title: 'Light',
                                value: '20 cbl')
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: screenWidth * 0.74,
                      child: ReadMoreText(
                          "Pineapple is a tropical fruit appreciated for its sweet and refreshing taste. Here is a description of the pineapple and the conditions in which it is typically grown:Description of pineapple:Pineapple is a fruit that is characterized by its oval Climate: Pineapples are tropical plants that need warm temperatures and sunlight. They grow best in areas with an average temperature of 22-32 degrees Celsius (72-90 degrees Fahrenheit). They can tolerate some frost, but prolonged exposure to cold weather will kill the plant.\n" +
                              '''' Rainfall: Pineapples need an average rainfall of 1,500-2,000 mm (60-80 inches) per year. However, they can also be grown in areas with less rainfall, as long as they are irrigated regularly.
    Soil: Pineapples prefer well-drained, sandy loam soil with a pH of 5.5-6.5. They are not tolerant of heavy clay soils or soils that are prone to waterlogging.
    Sunlight: Pineapples need full sun to produce fruit. They can tolerate some shade, but they will not produce as many fruits if they do not get enough sunlight.
    Elevation: Pineapples can be grown up to an altitude of 1,000 meters (3,300 feet). However, they will not produce as many fruits at higher altitudes.
    In addition to these ideal conditions, pineapples also need to be protected from pests and diseases. Some common pests that attack pineapples include mealybugs, scale insects, and nematodes. Some common diseases that attack pineapples include pineapple wilt, pineapple black spot, and pineapple leaf spot.

    By providing the right conditions, you can help your pineapple plants thrive and produce delicious fruits.

    Here are some additional tips for growing pineapples:

    Plant pineapple crowns in the spring or summer.
    Space the plants 1-2 meters (3-6 feet) apart.
    Fertilize the plants every 2-3 months with a balanced fertilizer.
    Water the plants regularly, especially during the dry season.
    Protect the plants from pests and diseases.
    With proper care, you can enjoy fresh pineapples from your own backyard in just a few years.'''
                                  ', ',
                          trimLines: 10,
                          colorClickableText: Colors.blue,
                          trimMode: TrimMode.Line,

                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w400)),
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
