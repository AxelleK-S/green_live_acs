import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:green_live_acs/page/add_farm_page.dart';
import 'package:green_live_acs/page/culture_page.dart';
import 'package:green_live_acs/page/dashboard_page.dart';

part 'accueil_event.dart';
part 'accueil_state.dart';

class AccueilBloc extends Bloc<AccueilEvent, AccueilState> {
  AccueilBloc(FirebaseFirestore db) : super(AccueilInitial(page: AddFarmPage(db: db,))) {
    on<AccueilEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<Home>((event, emit) => emit(AccueilInitial(page: AddFarmPage(db: db,))));
    on<Culture>((event, emit) => emit(AccueilCulture(page: CulturePage())));
    on<Profile>((event, emit) => emit(AccueilProfile(page: DashboardPages())));

  }
}
