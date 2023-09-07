import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/Service/add_farm_bloc/add_farm_bloc.dart';
import 'package:green_live_acs/Service/add_farm_bloc/add_farm_bloc.dart';
import 'package:green_live_acs/component/Input_form.dart';
import 'package:green_live_acs/model/Farm.dart';
import 'package:green_live_acs/ressouces/my_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddFormPage extends StatelessWidget {
  TextEditingController MenuController = TextEditingController();
  var name = InputFromText(title: 'name', hintText: 'Enter farm name');
  var superficie = InputFromText(title: 'superficie', hintText: 'superficie');
  var Kit_id = InputFromText(title: 'kit id', hintText: 'Enter kit id');
  var passeword = InputFromText(title: 'password', hintText: 'Enter password');

  late File _image;
  @override
  build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    print(screenWidth);

    // TODO: implement build
    return BlocBuilder<AddFarmBloc, AddFarmState>(builder: (context, state) {
      if (state is AddFarmInitial) {
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
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
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
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
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
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(280, 190)),
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
                height: screenHeight * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text("Add a new farm",
                            style: GoogleFonts.roboto(
                                fontSize: 30,
                                color: MyColors.primaryColor,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        {
                          var width = constraints.maxWidth;
                          print(width);
                          return Column(
                            children: [
                              Column(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      name,
                                      Row(children: [
                                        SizedBox(
                                            width: width * 0.5,
                                            child: superficie),
                                        SizedBox(
                                            width: width * 0.5,
                                            height: 60,
                                            child: DropdownMenu(
                                              controller: MenuController,
                                              //   menuHeight: 50,
                                              menuStyle: MenuStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.zero)),
                                              width: width * 0.5,
                                              hintText: 'superficie',
                                              dropdownMenuEntries: [
                                                DropdownMenuEntry(
                                                    value: 'patate',
                                                    label: 'patate'),
                                                DropdownMenuEntry(
                                                    value: 'manioc',
                                                    label: 'manioc'),
                                                DropdownMenuEntry(
                                                    value: 'legume',
                                                    label: 'legume'),
                                              ],
                                            ))
                                      ]),
                                      Kit_id,
                                      passeword,
                                      SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              MyColors.primaryColor,
                                          radius: 50,
                                          child: IconButton(
                                              onPressed: () {

                                                ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
                                                 final  image = File(value!.path);
                                                 _image = image ;
                                                });

                                              },
                                              icon: Icon(
                                                Icons.link_sharp,
                                                color: Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                      Text('link image',
                                          style: GoogleFonts.roboto(
                                              fontSize: 15,
                                              color: MyColors.primaryColor,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    SizedBox(
                      width: screenWidth * 0.85,
                      height: 45,
                      child: MaterialButton(
                          color: MyColors.primaryColor,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () async {

                            var user = await SharedPreferences.getInstance();
                            context.read<AddFarmBloc>().add(FarmCreate(
                                farm: Farm(
                                    cultureId: this.MenuController.text,
                                    name: this.name.data.text,
                                    kitId: this.Kit_id.data.text,
                                    superficie: this.superficie.data.text,
                                    state: 'semit',
                                    userId: user.getString('email'),
                                  image: _image.path

                                )));
                          },
                          child: Text("Submit")),
                    )
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
        );
      } else {
        return state.state;
      }
    });
  }
}
