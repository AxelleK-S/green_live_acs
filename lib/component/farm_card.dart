import 'package:cached_network_image/cached_network_image.dart';
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

          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: SizedBox(
              height: 58,
              width: 58,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: image!,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
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
                  color: Color(0xFF162C15)
                )),
                //SizedBox(height: 15,),
                Text(state!, style: GoogleFonts.roboto(
                  fontSize: 15,
                    color: Color(0xFF333333),
                  fontWeight: FontWeight.w500
                )
                )
              ]
            ),
          )

        ],

      ),
    );
  }
}