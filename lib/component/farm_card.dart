import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FarmCard extends StatelessWidget {
  var image;

  var state;

  var Farm_name;


  FarmCard ({ this.image , this.state , this.Farm_name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [

        SizedBox(
          height: 58,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/farm.jpeg"),
          ),
        ),
       // SizedBox(width: 3,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Pineapple Farm" , style: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.w500
              )),
              //SizedBox(height: 15,),
              Text("last check date 2min", style: GoogleFonts.roboto(
                fontSize: 15
              ))
            ]
          ),
        )

      ],

    );
  }
}