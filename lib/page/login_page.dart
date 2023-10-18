
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/Service/routing_bloc.dart';
import 'package:green_live_acs/page/sign_up_page.dart';
import 'package:green_live_acs/repository/user_repository.dart';
import 'package:green_live_acs/page/loading_page.dart';
import 'package:green_live_acs/ressouces/my_colors.dart';

import '../Service/Auth/login_bloc.dart';
import '../Service/cubit/string_cubit.dart';

class LoginPage extends StatelessWidget {
 final TextEditingController _emailController = TextEditingController();
 final  TextEditingController _passwordController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;

    // TODO: implement build
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state){
          print(state.toString());
          if (state is LoginInitial) {
            print(state.toString());
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
            body: BlocProvider(
              create: (context) => StringCubit(),
              child: BlocBuilder<StringCubit, String>(
                builder: (context, email) {
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
                                "Don't have a account?",
                                style: GoogleFonts.poppins(),),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___ )=>SignUPPage()));

                                  },
                                  child: Text(
                                    "Create account",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.primaryColor,
                                        decoration: TextDecoration.underline),
                                  ),
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
                                    context.read<StringCubit>().setString(value.trim());
                                  },
                                controller: _emailController,
                                  decoration:
                                  InputDecoration(

                                      hintText: 'entrer email'
                                  )
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

                                hintText: 'enter password'
                                )                      ),
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
                                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    color: MyColors.primaryColor,
                                    child: MaterialButton(
                                        onPressed: () {
                                          if(email == "" || _passwordController.text.isEmpty) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text("Please fill all fields")),
                                            );
                                          }else {
                                            context.read<LoginBloc>().add(LoginEmit(
                                                email: email,
                                                password: _passwordController.text
                                            ));
                                          }
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
                                  elevation: 0,
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
                  );
                }
              ),
            ),
          );
          }
          else if ( state is LoginSucefull) {
            context.read<RoutingBloc>().add(GoHome());

            return LoadPage();

          }


          else{
            print('failed state '+ state.toString());
            context.read<LoginBloc>().add(LoginInit());

            return LoadPage();

          }
        }
      ),
    );
  }
}
