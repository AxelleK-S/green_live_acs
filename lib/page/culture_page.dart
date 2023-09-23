import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/ressouces/my_colors.dart';

import 'culture_details.dart';

class CulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    List culture = ["potatos", "ananas", "pasteque"];
    // TODO: implement build
    return Scaffold(

        body:
            // Stack(
            //   children: [
            //     Container(
            //       width: 200,
            //       height: 200,
            //       color: Colors.blue,
            //     ),
            //     Positioned(
            //       top: 120,
            //       left: 50,
            //       child: Container(
            //         width: 100,
            //         height: 100,
            //         color: Colors.red,
            //       ),
            //     ),
            //   ],
            // )

            Stack(
                alignment: AlignmentDirectional.center,
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
              Container(
                width: screenWidth,
                height: screenHeight,
              ),
              Positioned(
                bottom: 450,
                child: Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            opacity: 0.62,
                            image: AssetImage("assets/culture.png"),
                            fit: BoxFit.cover))),
              ),
              Positioned(
                top: 300,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(300, 80),
                          topRight: Radius.elliptical(280, 80))),
                  width: screenWidth,
                  height: screenHeight * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ListView.builder(
                        itemCount: 120,
                        itemBuilder: (context, index) {
                          return Center(
                              child: SizedBox(
                            width: screenWidth * 0.95,
                            //height: 480,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Culture",
                                        style: GoogleFonts.roboto(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500)),
                                    ...culture
                                        .map((e) => GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => CultureDetails()));
                                          },
                                          child: SizedBox(child: SizedBox(
                                      height:110,
                                            child: Card(
                                              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),

                                      color: Colors.black,
                                      child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                children: [
                                                Builder(builder: (context) {
                                                  var mediaQuery = MediaQuery.of(context);
                                                  double widgetnWidth = mediaQuery.size.width;
                                                  double widgetHeight = mediaQuery.size.height;
                                                  return SizedBox(
                                                    width: widgetnWidth * 0.409,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Image.asset(
                                                            "assets/an.png"

                                                        ),

                                                        Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                e, style: GoogleFonts.roboto(
                                                                  color: Colors.white,
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.w500
                                                              ),

                                                              ),
                                                              Row(
                                                                  children: [
                                                                    Icon(Icons.water_drop_outlined, color: Color(0xFFBEBEBE),size: 15,),
                                                                    Text(
                                                                        "200 mol", style: GoogleFonts.roboto(
                                                                        color: Color(0xFFBEBEBE)
                                                                    )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                    ),
                                                  );
                                                }),

                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                                                      child: SizedBox(
                                                        height: 50,
                                                        child: CircleAvatar(
                                                          backgroundColor: Colors.white,
                                                          radius: 50,
                                                          child: Icon(Icons.water_drop_outlined, color: Colors.black,),
                                                        ),
                                                      ),
                                                    ),
                                                  )




                                              ]
                                            )
                                      ),
                                    ),
                                          )),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ));
                        }),
                  ),
                  //child: Text("Culture"),
                ),
              )
            ]));
  }
}
