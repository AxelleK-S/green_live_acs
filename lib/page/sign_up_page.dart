import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/page/loading_page.dart';
import 'package:green_live_acs/page/login_page.dart';
import 'package:image_picker/image_picker.dart';

import '../Service/Auth/sing_up/sign_up_bloc.dart';
import '../ressouces/my_colors.dart';

class SignUPPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  late File _image ;
  String email = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: 100,
        leadingWidth: 200,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 100,
                child: CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/GreenFarm.png")),
              ),
            )
          ],
        ),
      ),
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            if(state is SignUpInitial){
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to Green Live",
                        style: GoogleFonts.poppins(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Sign Up to continue",
                        style: GoogleFonts.poppins(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            "Do you already have a account ? ",
                            style: GoogleFonts.poppins(),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => LoginPage()));

                            },
                            child: Text(
                              "log in ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.primaryColor,

                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                      Text(
                        "I take less than a minute ",
                        style: GoogleFonts.poppins(),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Name",
                        style: GoogleFonts.poppins(),
                      ),
                      Card(
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                                hintText: 'enter your name'
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Email",
                        style: GoogleFonts.poppins(),
                      ),
                      Card(
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              // Vérifie si le champ de texte est vide
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              // Vérifie si l'email est valide en utilisant une expression régulière (regex)
                              final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if (!regex.hasMatch(value.trim())) {
                                return 'Please enter a valid email';
                              }
                              email = value;
                            },
                            decoration: InputDecoration(
                                hintText: 'enter your email'
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Password", style: GoogleFonts.poppins()),
                      Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: 'enter your password'
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Align(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: CircleAvatar(
                                backgroundColor:
                                MyColors.primaryColor,
                                radius: 50,
                                child: IconButton(
                                    onPressed: () {
                                      ImagePicker().pickImage(
                                          source: ImageSource
                                              .camera).then((
                                          value) {
                                        final image = File(
                                            value!.path);
                                        _image = image;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.link_sharp,
                                      color: Colors.white,
                                    )
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text('link image',
                                style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    color: MyColors.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),

                      Align(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot password? ",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: MyColors.primaryColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                            width: screenWidth * 0.9,
                            child: Card(
                                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                color: MyColors.primaryColor,
                                child: MaterialButton(
                                    onPressed: () {
                                      if (email == "" || _nameController.text.isEmpty || _passwordController.text.isEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text("Please fill all fields")),
                                        );
                                      } else {
                                        context.read<SignUpBloc>().add(SignUpPressed(_nameController.text,  _emailController.text, _passwordController.text,this._image));
                                      }
                                    },
                                    child: Text("Sign Up",
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                        ))))),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                            width: screenWidth * 0.9,
                            child: Card(
                                elevation: 0,
                                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                // color: Color(0xFF497948),
                                child: MaterialButton(
                                    onPressed: () {
                                      print(_emailController.text);

                                      context.read<SignUpBloc>().add(SignUpPressed(_nameController.text,  _emailController.text, _passwordController.text,this._image));

                                    },
                                    child: Icon(Icons.apple)))),
                      )
                    ],
                  ),
                ),
              );
            } else if( state is SignUpStart) {
              return LoadPage();
            }else if (State is SignUpFailed){
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to Green Live",
                        style: GoogleFonts.poppins(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Sign Up to continue",
                        style: GoogleFonts.poppins(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            "Do you already have a account ? ",
                            style: GoogleFonts.poppins(),
                          ),
                          TextButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(0))),
                            onPressed: () {
                              Navigator.push(context, PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => LoginPage()));
                            },
                            child: Text(
                              "log in ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.primaryColor,

                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                      Text(
                        "I take less than a minute ",
                        style: GoogleFonts.poppins(),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Name",
                        style: GoogleFonts.poppins(),
                      ),
                      Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                hintText: 'enter your name'
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Email",
                        style: GoogleFonts.poppins(),
                      ),
                      Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                hintText: 'enter your email'
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Password", style: GoogleFonts.poppins()),
                      Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'enter your passeword'
                            ),
                          ),
                        ),
                      ),
                      Align(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: CircleAvatar(
                                backgroundColor:
                                MyColors.primaryColor,
                                radius: 50,
                                child: IconButton(
                                    onPressed: () {
                                      ImagePicker().pickImage(
                                          source: ImageSource
                                              .camera).then((
                                          value) {
                                        final image = File(
                                            value!.path);
                                        _image = image;
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
                      ),

                      Align(
                        child: TextButton(
                          onPressed: () {

                          },
                          child: Text(
                            "Forgot password? ",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: MyColors.primaryColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                            width: screenWidth * 0.9,
                            child: Card(
                                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                color: MyColors.primaryColor,
                                child: MaterialButton(
                                    onPressed: () {
                                      print(email);
                                      // if (email == "" || _nameController.text.isEmpty || _passwordController.text.isEmpty) {
                                      //   ScaffoldMessenger.of(context).showSnackBar(
                                      //     const SnackBar(content: Text("Please fill all fields")),
                                      //   );
                                      // } else {
                                      //   context.read<SignUpBloc>().add(SignUpPressed(_nameController.text,  _emailController.text, _passwordController.text,this._image));
                                      // }
                                    },
                                    child: Text("Sign Up",
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                        ))))),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                            width: screenWidth * 0.9,
                            child: Card(
                                elevation: 0,
                                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                // color: Color(0xFF497948),
                                child: MaterialButton(
                                    onPressed: () {
                                      context.read<SignUpBloc>().add(SignUpPressed(_nameController.text,  _emailController.text, _passwordController.text,this._image));

                                    },
                                    child: Icon(Icons.apple)))),
                      )
                    ],
                  ),
                ),
              );
            }else{
              Navigator.pop(context);
              return LoadPage() ;

            }

          },
        ),
      ),
    );
  }
}