import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/Service/navigate_bloc/navigate_bloc.dart';
import 'package:green_live_acs/ressouces/my_colors.dart';

class Accueil extends StatelessWidget {
  FirebaseFirestore db;

  Accueil(FirebaseFirestore this.db, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    // TODO: implement build
    return BlocProvider(
      create: (context) => NavigateBloc(this.db),
      child: Scaffold(



        resizeToAvoidBottomInset: true,
        // bottomNavigationBar:

        body: Stack(
          alignment: AlignmentDirectional.center,
          children:[ BlocBuilder<NavigateBloc, NavigateState>(
              builder: (context, state) {
                return state.page;
              }
          ),

            Positioned(
              top: screenHeight*0.89,
              child: BlocBuilder<NavigateBloc, NavigateState>(
                builder: (context, state) {
                  if (state is NavigateInitial)
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          //color: Colors.black12,
                        ),
                        //  color: Colors.black12,
                        height: 80,
                        width: screenWidth * 0.85,
                        child: Card(
                          elevation: 0,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,

                                          children: [
                                            GestureDetector(
                                              onTap: () {


                                              },
                                              child: Icon(
                                                  Icons.dashboard_customize_outlined,
                                                  color: MyColors.primaryColor
                                              ),
                                            ),
                                            Text(
                                              'farm', style: GoogleFonts.roboto(
                                                color: MyColors.primaryColor
                                            ),
                                            )

                                          ]
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          context.read<NavigateBloc>().add(SweepCulture());
                                        },
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,

                                            children: [
                                              Icon(Icons.shop_outlined,   color: Color(0xFF636361), ),
                                              Text(
                                                'culture', style: GoogleFonts.roboto(
                                                color: Color(0xFF636361),
                                              ),
                                              )

                                            ]
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,

                                          children: [
                                            Icon(Icons.person_2_outlined,
                                              color: Color(0xFF636361),),
                                            Text(
                                              'profile', style: GoogleFonts.roboto(
                                              color: Color(0xFF636361),
                                            ),
                                            )

                                          ]
                                      ),
                                    )

                                  ]
                              )
                          ),
                        ),
                      ),
                    );
                  else if ( state is NavigateCulture) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Container(

                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.all(Radius.circular(20)),
                          //color: Colors.black12,
                        ),
                        //  color: Colors.black12,
                        height: 80,
                        width: screenWidth * 0.85,
                        child: Card(
                          elevation: 0,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            context.read<NavigateBloc>().add(SweepHome());
                                          },
                                          child: Icon(
                                            Icons.dashboard_customize_outlined,
                                            color: Color(0xFF636361),
                                          ),
                                        ),
                                        Text(
                                          'farm', style: GoogleFonts.roboto(
                                          color: Color(0xFF636361),
                                        ),
                                        )

                                      ]
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [
                                          Icon(Icons.shop_outlined, color: MyColors.primaryColor,),
                                          Text(
                                            'culture', style: GoogleFonts.roboto(
                                              color: MyColors.primaryColor
                                          ),
                                          )

                                        ]
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,

                                      children: [
                                        Icon(Icons.person_2_outlined,
                                          color: Color(0xFF636361),
                                        ),
                                        Text(
                                          'profile', style: GoogleFonts.roboto(
                                          color: Color(0xFF636361),
                                        ),
                                        )

                                      ]
                                  ),
                                )

                              ]
                          ),
                        ),
                      ),
                    );
                  } else
                    return Container();

                },
              ),
            ),],
        ),

      ),
    );
  }
}