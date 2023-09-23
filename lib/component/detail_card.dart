import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCard extends StatelessWidget {
  IconData? icons;
  String title;
  String value;

   DetailsCard({Key? key , required this.icons, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return     SizedBox(
      width: 155,
      height: 80,
      child: Card(
        elevation: 0,
        color: Color(0xFFEEEEEE),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              children: [
                Icon(icons , color: Color(0xff6C6C6C),),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6C6C6C)
                      )),
                      Text(value, style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6C6C6C)
                      ))
                    ],
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}