import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:green_live_acs/repository/user_repository.dart';
import 'package:green_live_acs/page/Accueil.dart';
import 'package:green_live_acs/page/add_form_page.dart';
import 'package:green_live_acs/page/loading_page.dart';
import 'package:green_live_acs/page/sign_up_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../page/add_farm_page.dart';
import '../page/dashborad.dart';
import '../page/login_page.dart';

part 'routing_event.dart';
part 'routing_state.dart';

class RoutingBloc extends Bloc<RoutingEvent, RoutingState> {
  int index =0 ;

  static const String _accessTokenKey = 'email';

  RoutingBloc(FirebaseFirestore db , UserRepository userRepository) : super(RoutingInitial(db, userRepository)) {

    on<RoutingMainEvent>((event, emit) => emit((RoutingInitial(db, userRepository))));
    on<ViewDashboard>((event, emit) {
      // TODO: implement event handler
      print("ok");
      emit(RoutingDashboard());

    });

    on<Login>((event, emit) => emit(RoutingLogin(userRepository: userRepository)));
    on<GoHome>((event, emit) => emit(RoutingHome(Accueil(db))));
    on<AddForm>((event, emit)

    {
      print('add farm page !!!!!!!!!!!!!');
      index++ ;
      emit(RoutingAddFarm(index));});

    //on<ViewDashboard>((event, emit) => emit(RoutingDashboard()));
  }
}
