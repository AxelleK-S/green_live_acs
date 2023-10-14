part of 'menu_style_bloc.dart';

abstract class MenuStyleState extends Equatable {
  const MenuStyleState();
}

class MenuStyleInitial extends MenuStyleState {
  bool state;
  MenuStyleInitial(this.state);
  @override
  List<Object> get props => [this.state];
}
