import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'menu_style_event.dart';
part 'menu_style_state.dart';

class MenuStyleBloc extends Bloc<MenuStyleEvent, MenuStyleState> {
  bool clicked = false;
  MenuStyleBloc() : super(MenuStyleInitial(false)) {
    on<MenuStyleEventCLicked>((event, emit) {
      // TODO: implement event handler
      this.clicked = !this.clicked;
          emit(MenuStyleInitial(clicked));
    });
  }
}


