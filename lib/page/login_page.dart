
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/repository/user_repository.dart';
import 'package:green_live_acs/page/loading_page.dart';
import 'package:green_live_acs/ressouces/my_colors.dart';

import '../Service/Auth/login_bloc.dart';

class LoginPage extends StatelessWidget {
 final TextEditingController _emailController = TextEditingController();
 final  TextEditingController _passwordController = TextEditingController();
 
 UserRepository userRepository;
LoginPage({required this.userRepository});
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;

    // TODO: implement build
    return BlocProvider(
      create: (context) => LoginBloc(userRepository: userRepository),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state){
          print(state.toString());
          if (state is LoginInitial) {
            print(state.toString());
            return Scaffold(
            appBar: AppBar(
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
            body: SingleChildScrollView(
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
                      "Sign in to continue",
                      style: GoogleFonts.poppins(
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          "Don't have a account? ",
                          style: GoogleFonts.poppins(),
                        ),
                        TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.all(0))),
                          onPressed: () {},
                          child: Text(
                            "Create an account ",
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
                      "Email",
                      style: GoogleFonts.poppins(),
                    ),
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _emailController,
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
                          decoration:
                          InputDecoration(
                              icon: Icon(Icons.remove_red_eye_sharp)),
                        ),
                      ),
                    ),
                    Align(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password? ",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              color: MyColors.primaryColor),
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
                                 context.read<LoginBloc>().add(LoginEmit(
                                     email: _emailController.text,
                                     password: _passwordController.text
                                 ));
                                  },
                                  child: Text("Login",
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                      ))))),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                          width: screenWidth * 0.9,
                          child: Card(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              // color: Color(0xFF497948),
                              child: MaterialButton(
                                  onPressed: () {

                                  },
                                  child: Icon(Icons.apple)))),
                    )
                  ],
                ),
              ),
            ),
          );
          }
          else {
            print("merde");
            return state.page;
          }
        }
      ),
    );
  }
}
