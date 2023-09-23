import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:green_live_acs/model/Farm.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'farm_event.dart';
part 'farm_state.dart';

class FarmBloc extends Bloc<FarmEvent, FarmState> {
  FarmBloc(FirebaseFirestore db) : super(FarmInitial()) {

    on<FarmBegin>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? id =await prefs.getString('email');

      var farm =   await Farm.GetFarmBYUserId(id!, db);

 emit(FarmPresent(farm : farm));
      // TODO: implement event handler


    });


  }
}
