import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: Colors.white,
        leadingWidth: screenWidth,
        toolbarHeight: 100,
        title: Padding(
          padding: EdgeInsets.fromLTRB(8, 120, 8, 120),
        )
      ),
      body:Container(

      ) ,
      backgroundColor: Colors.white,
    );
  }
}
