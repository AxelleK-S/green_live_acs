part of 'pie_bloc.dart';

abstract class PieState extends Equatable {
  final int touchedIndex;
  const PieState({required this.touchedIndex});
}

class PieInitial extends PieState {
   PieInitial({required super.touchedIndex});
  @override
  List<Object> get props => [];
}

class ChangeState extends PieState {

  ChangeState({required super.touchedIndex});
  @override
  List<Object> get props => [this.touchedIndex];
}