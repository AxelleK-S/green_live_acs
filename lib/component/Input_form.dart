import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ressouces/my_colors.dart';

class InputFromText extends StatelessWidget{
  String title;
  String hintText;
  InputFromText({required this.title,required this.hintText});
  late TextEditingController data ;
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: GoogleFonts.roboto(
         // color: MyColors.subtitleColor,
          fontSize: 15,
          fontWeight: FontWeight.w500

        )),
        SizedBox(
          height: 60,
          child: Card (
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(3, 0, 3, 20),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side:BorderSide(
                  width: 0.8
                ),


              ),

              child:Padding(
                padding: const EdgeInsets.fromLTRB(8,5, 0, 0),
                child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: GoogleFonts.roboto(
                          color: MyColors.subtitleColor,

                        )
                    )
                ),
              )
          ),
        ),
      ],
    );
  }


}