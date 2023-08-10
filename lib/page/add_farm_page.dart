import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/farm_card.dart';

class _MyHomePage extends StatelessWidget{
  int _counter = 0;



  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    var farmList = [
      "My pienaple Farm",
      "My pienaple Farm20",
      "My pienaple Farm22",
      "My pienaple Farm23",
      "My pienaple Farm24",
      "My pienaple Farm25",
      "My pienaple Farm23",
      "My pienaple Farm24",
      "My pienaple Farm25",
      "My pienaple Farm23",
      "My pienaple Farm24",
      "My pienaple Farm25",
      "My pienaple Farm23",
      "My pienaple Farm24",
      "My pienaple Farm25",
      "My pienaple Farm23",
      "My pienaple Farm24",
      "My pienaple Farm25",






    ];
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.black,
        toolbarHeight: 150,
        leadingWidth: screenWidth,
        leading: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.70,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back",
                            style: GoogleFonts.roboto(fontSize: 35),
                          ),
                          Text("ACS",
                              style: GoogleFonts.roboto(
                                  fontSize: 30, fontWeight: FontWeight.bold))
                        ]),
                  ),
                  const Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage("assets/avatar.jpeg"),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ]),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Divider(
                    //thickness: 20,c
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10,0, 0),
        child: SizedBox(
          height: screenHeight,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.65,
                child: SingleChildScrollView(
                  child: Column(children: [
                    ...farmList
                        .map(
                          (e) => Card(
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                          elevation: 0,
                          child: FarmCard()),
                    )
                        .toList(),
                  ]),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    width: screenWidth * 0.9,
                    child: Card(
                        margin: EdgeInsets.fromLTRB(0, 15,  0, 0),
                        color: Color(0xFF000000),
                        child: MaterialButton(
                            onPressed: () {}, child: Text("+ Add Farm" , style: GoogleFonts.roboto(color: Colors.white,))))

                ),
              )],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}