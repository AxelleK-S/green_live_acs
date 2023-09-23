part of 'pie_bloc.dart';

abstract class PieEvent extends Equatable {
  const PieEvent();
}


class Touch extends PieEvent {
  final FlTouchEvent event;
  final BarTouchResponse? response;
  Touch(this.event,  this.response);

  @override
  List<Object> get props => [];
}
