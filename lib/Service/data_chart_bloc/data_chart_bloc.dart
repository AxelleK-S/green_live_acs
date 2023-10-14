import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_chart_event.dart';
part 'data_chart_state.dart';

class DataChartBloc extends Bloc<DataChartEvent, DataChartState> {
  DataChartBloc() : super(DataChartInitial(datas: [])) {
    on<DataChartEvent>((event, emit) {
      // TODO: implement event handler
    });

    // on<DataChat>((event, emit) {
    //
    // })
  }
}
