import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:green_live_acs/repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;
  FirebaseStorage storage;


  SignUpBloc(this.userRepository , db , this.storage) : super(SignUpInitial()) {
    on<SignUpPressed>((event, emit) async {
      var ims ;

      try{
        emit(SignUpStart());


        await  userRepository.signUp( event.name, event.email, event.password , event.image);
        emit(SignUpSuccefuly());

      }catch(e){
        emit(SignUpFailed());
      }

      // TODO: implement event handler
    });
  }
}

