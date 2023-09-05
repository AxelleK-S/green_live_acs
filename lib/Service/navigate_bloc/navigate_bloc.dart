import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:green_live_acs/page/add_farm_page.dart';
import 'package:green_live_acs/page/culture_page.dart';
import 'package:green_live_acs/page/dashborad.dart';
import 'package:green_live_acs/page/login_page.dart';
import 'package:meta/meta.dart';

part 'navigate_event.dart';
part 'navigate_state.dart';

class NavigateBloc extends Bloc<NavigateEvent, NavigateState> {
  NavigateBloc(FirebaseFirestore db) : super(NavigateInitial(db)) {
    on<SweepCulture>((event, emit) {
      // TODO: implement event handler
      emit(NavigateCulture(db));
    });
    on<SweepHome>((event, emit) {
      // TODO: implement event handler
      emit(NavigateInitial(db));
    });
  }
}
