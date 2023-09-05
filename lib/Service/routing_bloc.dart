import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

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

  static const String _accessTokenKey = 'email';

  RoutingBloc(FirebaseFirestore db) : super(RoutingInitial()) {
    on<RoutingMainEvent>((event , emit) async {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isAuthenticated = prefs.containsKey(_accessTokenKey);
      print("home aweet homwe");
      if (isAuthenticated) {
        print("nice to meet you");
        emit(RoutingMain(db: db));
      } else {
        print("bad news");
        emit(RoutingLogin(userRepository: UserRepository(db: db)));
      }

    });
    on<ViewDashboard>((event, emit) {
      // TODO: implement event handler
      print("ok");
      emit(RoutingDashboard());

    });

    //on<ViewDashboard>((event, emit) => emit(RoutingDashboard()));
  }
}
