

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/user_repository.dart';
import '../../page/Accueil.dart';
import '../../page/add_farm_page.dart';
import '../../page/dashborad.dart';
import '../../page/loading_page.dart';
import '../../page/login_page.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;
  FirebaseFirestore db;


  LoginBloc({ required this.userRepository , required this.db}) : super(LoginInitial(userRepository: userRepository)) {
    on<LoginEmit>((event, emit) async {


      // TODO: implement event handler
      try{
        emit(LoginPressed());
        print("object");
        await userRepository.signInWithCredentials(event.email, event.password);

        if (userRepository.isLoggedIn()) {

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('email', event.email);



          emit(LoginSucefull(db: userRepository.db));
          print("successfully");
        } else {
          emit(LoginFailed(message: "An error occured"));
        }
      }catch(e){
        List<String> parts = e.toString().split(']');
        String message = parts[1];
        emit(LoginFailed(message: message.trim()));
      }
  });

    on<LoginInit>((event, emit) => emit(LoginInitial(userRepository: userRepository)));
    on<DelToken>((event, emit) async {

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.remove('email');
    });

}

}


