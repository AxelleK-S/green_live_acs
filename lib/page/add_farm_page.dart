import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/model/Farm.dart';
import 'package:green_live_acs/page/dashborad.dart';
import 'package:green_live_acs/page/dashborsd_v2.dart';
import 'package:green_live_acs/ressouces/my_colors.dart';

import '../Service/FarmBloc/farm_bloc.dart';

import '../Service/routing_bloc.dart';
import '../component/farm_card.dart';
import 'add_form_page.dart';

class AddFarmPage extends StatelessWidget {
  int _counter = 0;
  FirebaseFirestore db;
  int index = 0;

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
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        //backgroundColor: Colors.black,
        toolbarHeight: 155,
        leadingWidth: screenWidth,
        leading: Padding(
          padding: const EdgeInsets.all(23.0),
          child: Center(
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
                              style: GoogleFonts.roboto(fontSize: 30),
                            ),

                            Text("ACS",
                                style: GoogleFonts.roboto(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.primaryColor)),
                          ]),
                    ),
                    const Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Focus(
                              child: SizedBox(
                                height: 40,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage("assets/avatar.jpeg"),
                                ),
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
      ),
      body: BlocBuilder<FarmBloc, FarmState>(
        builder: (context, state) {
          if(state is FarmInitial)
          context.read<FarmBloc>().add(FarmBegin());
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SizedBox(
              height: screenHeight*0.84,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<FarmBloc, FarmState>(
                    builder: (context, state) {
                      if (state is FarmPresent) {
                        return Container(
                          constraints: BoxConstraints(
                            maxHeight: screenHeight * 0.55,
                          ),
                          height: screenHeight*0.54,
                          child: (state.farm.isNotEmpty)?SingleChildScrollView(
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
                                                          DashboardV2(),
                                                ));
                                          },
                                          image: e.image,
                                          state: e.cultureId,
                                          Farm_name: e.name,
                                        )),
                                  )
                                  .toList(),
                            ]),
                          ): Center(
                            child: SizedBox(
                                height: screenHeight*0.44,
                                child: Image.asset('assets/empty.png')),
                          ),
                        );
                      } else {
                        return SizedBox(
                            width: screenWidth,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ));
                      }
                    },
                  ),
                  Center(
                    child: SizedBox(
                        width: screenWidth * 0.9,

                        child: Card(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, screenHeight*0.14),
                            color: MyColors.primaryColor,
                            child: MaterialButton(
                                onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => AddFormPage()));

                                  // index++;
                                  //context.read<RoutingBloc>().add(AddForm(index :index));
                                  print('this is the sate ${state}');
                                },
                                child: Text("+ Add Farm",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 20))))),
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
  }
}
