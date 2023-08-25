import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataComposant extends StatelessWidget{
  var image;
  var state;
  var Farm_name;
  DataComposant ({ this.image , this.state , this.Farm_name});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        shadowColor: Colors.white,
       // semanticContainer: false,
        //elevation: 3,
       // onTap: (){},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                     height: 50,
                    // width: 150,
                    child: Image.asset("assets/Soil.png"),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Soil", style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500)),
                      Text("clay type", style: GoogleFonts.roboto(fontSize: 10)),
                    ],
                  ),


                ],
              ),
              Text("50%", style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.w400)),
            ],

          ),
        ),
      ),
    );
  }
}