import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/Service/menu/menu_bloc.dart';
import 'package:green_live_acs/ressouces/my_colors.dart';

import '../Service/accueil/accueil_bloc.dart';
import '../Service/routing_bloc.dart';

class Accueil extends StatelessWidget {
  FirebaseFirestore db;

  Accueil(FirebaseFirestore this.db, {Key? key}) : super(key: key);

  var selectedItem=[
    true,
    false,
    false,


  ];
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    // TODO: implement build
    return Scaffold(



      resizeToAvoidBottomInset: true,
      // bottomNavigationBar:

      body: Stack(
        alignment: AlignmentDirectional.center,
        children:[ BlocBuilder<AccueilBloc, AccueilState>(
            builder: (context, state) {
              return state.page.animate()
              .fadeIn()
              .scale()
              .slideX(
                duration: const Duration(milliseconds: 500),
              );
            }
        ),

          Positioned(
            top: screenHeight*0.89,
            child: BlocBuilder<MenuBloc, MenuState>(
              builder: (context, state) {
                if (state is MenuInitial) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Container(
                      decoration: const BoxDecoration(
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        context.read<MenuBloc>().add(MenuChanged( listButton: selectedItem, index: 0));
                                        context.read<AccueilBloc>().add(Home());
                                      },
                                      icon: Icon(Icons.home,
                                        color: state.listButton[0] ? MyColors.primaryColor :Color(0xffCCCCCC),
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        context.read<MenuBloc>().add(MenuChanged( listButton: state.listButton, index: 1));
                                        context.read<AccueilBloc>().add(Culture());

                                      }, icon: Icon(Icons.wallet_rounded,
                                    color: state.listButton[1] ? MyColors.primaryColor : Color(0xffCCCCCC),)),
                                 

                                  IconButton(
                                      onPressed: () {
                                        context.read<MenuBloc>().add(MenuChanged( listButton: selectedItem, index: 2));
                                        context.read<AccueilBloc>().add(Profile());

                                      },
                                      icon: Icon(Icons.person,
                                        color: state.listButton[2] ? MyColors.primaryColor : Color(0xffCCCCCC),)),
                                ])
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

    );
  }
}