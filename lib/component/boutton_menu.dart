import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BouttonMenu extends StatelessWidget{
   double size;
   String title ;
   IconData icon;
   VoidCallback func ;

  Color color;

   BouttonMenu({required this.size ,  required this.title, required this.icon , required this.color , required this.func});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return   TextButton(
     style: ButtonStyle(
         backgroundColor:
         MaterialStateProperty.all(
             Colors.white)),
     onPressed: func,
     child: SizedBox(
       width : size,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,

         children: [
           Text(title, style: GoogleFonts.poppins(
               fontWeight: FontWeight.w500,
               color: color,
             fontSize: 15
           ),),
           Icon(icon, color: color,)
         ],
       ),
     ),
   );
  }

}