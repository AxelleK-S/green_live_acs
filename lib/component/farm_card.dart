import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/page/dashborad.dart';

class FarmCard extends StatelessWidget {
  String? image;

  String? state;

  String? Farm_name;
  VoidCallback function;


  FarmCard ({ required this.image , required this.state , required this.Farm_name , required this.function});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: function,
      child: Row(
        children:  [

          SizedBox(
            height: 58,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(image!),
            ),
          ),
         // SizedBox(width: 3,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Farm_name! , style: GoogleFonts.roboto(
              fontSize: 22,
              fontWeight: FontWeight.w500,
                  color: Colors.black
                )),
                //SizedBox(height: 15,),
                Text(state!, style: GoogleFonts.roboto(
                  fontSize: 15,
                    color: Colors.black
                ))
              ]
            ),
          )

        ],

      ),
    );
  }
}