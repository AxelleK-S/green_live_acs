import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/model/Farm.dart';
import 'package:green_live_acs/page/dashborad.dart';

import '../Service/FarmBloc/farm_bloc.dart';

import '../component/farm_card.dart';
import 'add_form_page.dart';

class AddFarmPage extends StatelessWidget {
  int _counter = 0;
  FirebaseFirestore db;

  AddFarmPage({required this.db});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    var farmList = [
      "My pienaple Farm",
      "My pienaple Farm20",
      "My pienaple Farm20",
    ];
    return BlocProvider(
      create: (context) => FarmBloc(this.db),
      child: BlocBuilder<FarmBloc, FarmState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(

              //backgroundColor: Colors.black,
              toolbarHeight: 150,
              leadingWidth: screenWidth,
              leading: Padding(
                padding: const EdgeInsets.all(23.0),
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
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold))
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
                                    backgroundImage:
                                        AssetImage("assets/avatar.jpeg"),
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
            body: BlocBuilder<FarmBloc, FarmState>(
              builder: (context, state) {
                context.read<FarmBloc>().add(FarmBegin());
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    height: screenHeight,
                    child: Column(
                      children: [
                        BlocBuilder<FarmBloc, FarmState>(
                          builder: (context, state) {
                            if (state is FarmPresent)
                              return SizedBox(
                                height: screenHeight * 0.65,
                                child: SingleChildScrollView(
                                  child: Column(children: [
                                    ...state.farm
                                        .map(
                                          (e) => Card(
                                              //elevation: 0,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 15, 0, 10),
                                              elevation: 0,
                                              child: FarmCard(
                                                function: () {
                                                  Navigator.push(
                                                      context,
                                                      PageRouteBuilder(
                                                        pageBuilder:
                                                            (__, ___, ____) =>
                                                                DashboardPage(),
                                                      ));
                                                },
                                                image: e.image,
                                                state: e.location,
                                                Farm_name: e.name,
                                              )),
                                        )
                                        .toList(),
                                  ]),
                                ),
                              );
                            else
                              return CircularProgressIndicator();
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                              width: screenWidth * 0.9,
                              child: Card(
                                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  color: Color(0xFF000000),
                                  child: MaterialButton(
                                     onPressed: (){ Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>AddFormPage()));                                },
                                      child: Text("+ Add Farm",
                                          style: GoogleFonts.roboto(
                                            color: Colors.white,
                                          ))))),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: _incrementCounter,
            //   tooltip: 'Increment',
            //   child: const Icon(Icons.add),
            // ),
          );
        },
      ),
    );
  }
}
