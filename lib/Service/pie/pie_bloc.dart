import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fl_chart/src/chart/base/base_chart/fl_touch_event.dart';
import 'package:fl_chart/src/chart/pie_chart/pie_chart_data.dart';

part 'pie_event.dart';
part 'pie_state.dart';

class PieBloc extends Bloc<PieEvent, PieState> {
  int touchedGroupIndex = 0;

  PieBloc() : super(PieInitial( touchedIndex: 0)) {
    on<Touch>((event, emit) {
      // if (!event.event.isInterestedForInteractions ||
      //     event.pieTouchResponse == null ||
      //     event.pieTouchResponse?.touchedSection == null) {
      //   touchedIndex = -1;
      //   emit(ChangeState(touchedIndex: touchedIndex));
      //   return;
      // }
      // //describe this code
      // touchedIndex =  event.pieTouchResponse?.touchedSection!.touchedSectionIndex ?? -1;
      // emit(ChangeState(touchedIndex: touchedIndex));
      //
      if (event.event.isInterestedForInteractions &&
          event.response != null &&
          event.response?.spot != null) {

          touchedGroupIndex = event.response?.spot!.touchedBarGroupIndex! ?? -1;
      } else {

          touchedGroupIndex = -1;

      }
      emit(ChangeState(touchedIndex: touchedGroupIndex));
      // TODO: implement event handler
    });
  }
}
