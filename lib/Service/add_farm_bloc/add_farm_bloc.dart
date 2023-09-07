import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:green_live_acs/page/add_farm_page.dart';
import 'package:green_live_acs/page/add_form_page.dart';

import '../../model/Farm.dart';
import '../../page/loading_page.dart';
import '../../repository/farm_repository.dart';

part 'add_farm_event.dart';
part 'add_farm_state.dart';

class AddFarmBloc extends Bloc<AddFarmEvent, AddFarmState> {
  final FarmRepository farmRepository;

  AddFarmBloc({required this.farmRepository}) : super(AddFarmInitial(state:  Container())) {
    on<AddFarmEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<FarmCreate>((event, emit) async {

      try {
        emit(AddFarmBegin(state: LoadPage()));
        await this.farmRepository.AddFarm(event.farm);
        emit(AddFarmSuccess(state: AddFarmPage(db: this.farmRepository.db,)));



      } catch (e) {

        emit(AddFarmFailed(state: AddFormPage()));
      }


    });
  }
}
