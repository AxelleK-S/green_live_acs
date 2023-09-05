import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_farm_event.dart';
part 'add_farm_state.dart';

class AddFarmBloc extends Bloc<AddFarmEvent, AddFarmState> {
  AddFarmBloc() : super(AddFarmInitial()) {
    on<AddFarmEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
