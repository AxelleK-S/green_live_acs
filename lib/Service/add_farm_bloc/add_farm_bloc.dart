import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:green_live_acs/page/Accueil.dart';
import 'package:green_live_acs/page/add_farm_page.dart';
import 'package:green_live_acs/page/add_form_page.dart';

import '../../model/Farm.dart';
import '../../page/loading_page.dart';
import '../../repository/farm_repository.dart';

part 'add_farm_event.dart';
part 'add_farm_state.dart';

class AddFarmBloc extends Bloc<AddFarmEvent, AddFarmState> {

  final FarmRepository farmRepository;

  AddFarmBloc({required this.farmRepository , required BuildContext context } ) : super(AddFarmInitial(state:  Container())) {
    on<Init>((event, emit) {
      // TODO: implement event handler
      emit(AddFarmInitial(state: Container()));
    });

    on<FarmCreate>((event, emit) async {

      try {
        emit(AddFarmBegin(state: LoadPage()));
        await this.farmRepository.AddFarm(event.farm , event.image).then((value) =>         emit(AddFarmSuccess(state: AddFormPage()))
        );

      } catch (e) {

        emit(AddFarmFailed(state: AddFormPage() , e: e.toString()));
      }


    });
  }
}
