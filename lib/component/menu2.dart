import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Service/menu/menu_bloc.dart';
import '../ressouces/my_colors.dart';


class Menu2 extends StatelessWidget {
  bool  Darkmode ;
  Menu2({required this.Darkmode});
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

 var    listButton =[true, false];
    // TODO: implement build
    return BlocProvider(
      create: (context) => MenuBloc(listButton: [true, false]),
      child: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          if (state is MenuInitial) {
            return Container(
              width: screenWidth * 0.85,
              height: 60,
              decoration: BoxDecoration(
                color: (Darkmode) ? Color(0xff333333) : Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(60),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth*0.5,
                          height: 50,


                          child: MaterialButton(
                              color:(state.listButton[0])? MyColors.primaryColor :null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              onPressed: () {context.read<MenuBloc>().add(MenuChanged(listButton: listButton, index: 0));},

                              child: Text(
                                'Income',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: (state.listButton[0])
                                          ? Colors.white
                                          :Color(0xff272727),
                                ),
                              ))),
                      SizedBox(
                          width: constraints.maxWidth*0.5,
                          height: 50,


                          child: MaterialButton(
                              color:(state.listButton[1])? MyColors.primaryColor :null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              onPressed: () {context.read<MenuBloc>().add(MenuChanged(listButton: listButton, index: 1));},
                              child: Text(
                                'Expenses',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color:  (state.listButton[1])
                                      ? Colors.white
                                      : Color(0xff272727),
                                ),
                              )))
                    ],
                  );
                }),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
