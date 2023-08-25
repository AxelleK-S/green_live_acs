import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:green_live_acs/model/Farm.dart';

part 'farm_event.dart';
part 'farm_state.dart';

class FarmBloc extends Bloc<FarmEvent, FarmState> {
  FarmBloc(FirebaseFirestore db) : super(FarmInitial()) {

    on<FarmBegin>((event, emit) async {
  var farm =   await Farm.GetFarmBYUserId('1', db);

 emit(FarmPresent(farm : farm));
      // TODO: implement event handler


    });
  }
}
