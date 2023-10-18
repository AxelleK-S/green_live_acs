

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ressouces/my_colors.dart';

part 'bottom_chart_event.dart';
part 'bottom_chart_state.dart';

class BottomChartBloc extends Bloc<BottomChartEvent, BottomChartState> {
  BottomChartBloc() : super(BottomChartInitial()) {
    on<BottomChartEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<BottomChartEventCLickedDyas>((event, emit) => emit(BottomChartDays()));
    on<BottomChartEventCLickedMonths>((event, emit) => emit(BottomChartMonths()));
    on<BottomChartEventCLickedYears>((event, emit) => emit(BottomChartYears()));


  }
}
