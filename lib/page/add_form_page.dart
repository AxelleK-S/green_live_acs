import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/component/Input_form.dart';
import 'package:green_live_acs/ressouces/my_colors.dart';

class AddFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    print(screenWidth);
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back)),
            SizedBox(
              width: screenWidth,
              height: 380,
              child: Stack(alignment: AlignmentDirectional.center, children: [
                // Positioned(
                //     left: 100,
                //     child: IconButton(
                //         onPressed: () { Navigator.pop(context); } ,
                //         icon: Icon(Icons.arrow_back))),
                Positioned(
                  width: screenWidth + 160,
                  height: 400,
                  // bottom: 10,
                  top: 10,
                  // bottom : 180,

                  child: Container(
                    height: 400,
                    width: screenWidth + 30,
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(280, 190)),
                    ),
                    child:
                        //SizedBox(height: 10,),
                        Column(
                      children: [
                        SizedBox(
                            height: 400,
                            child: Image.asset("assets/culture.png")),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      appBar: AppBar(
          centerTitle: false,
          //automaticallyImplyLeading: false,

          //  backgroundColor: Colors.blue,
          leadingWidth: screenWidth,
          toolbarHeight: 100,
          leading: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back)),
              SizedBox(
                width: screenWidth,
                height: 380,
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  Positioned(
                      //left: 100,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back))),
                  Positioned(
                    width: screenWidth + 160,
                    height: 400,
                    bottom: 10,
                    // bottom : 180,

                    child: Container(
                      height: 400,
                      width: screenWidth + 30,
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(280, 190)),
                      ),
                      child:
                          //SizedBox(height: 10,),
                          Column(
                        children: [
                          SizedBox(
                              height: 400,
                              child: Image.asset("assets/culture.png")),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          )),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
      width: screenWidth * 0.85,
      height: screenHeight*0.7,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              children: [
                SizedBox(height: 30,),
                Text("Add a new farm", style: GoogleFonts.roboto(fontSize: 30,color: MyColors.primaryColor,fontWeight: FontWeight.bold)),
              ],
            ),
            LayoutBuilder(
              builder: (context,constraints){ {
                var width =constraints.maxWidth;
                print(width);
                return Column(
                  children: [
                    Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InputFromText(title: 'name', hintText: 'Enter farm name'),
                            Row(
                              children: [
                               SizedBox(
                                   width:width *0.5,
                                   child: InputFromText(title: 'title', hintText: 'hintText')),
                                SizedBox(
                                    width: width*0.5,
                                    child: InputFromText(title: 'title', hintText: 'hintText'))


                              ]
                            ),
                            InputFromText(title: 'kit id', hintText: 'Enter kit id'),
                            InputFromText(title: 'password', hintText: 'Enter password'),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              }
            },),
            SizedBox(
              width: screenWidth*0.85,
              height: 45,
              child: MaterialButton(
                color: MyColors.primaryColor,
                textColor: Colors.white,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),

                  onPressed: (){}, child: Text("Submit")),
            )
          ],
      ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
