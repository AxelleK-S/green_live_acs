part of 'farm_bloc.dart';

abstract class FarmState extends Equatable {
  const FarmState();
}

class FarmInitial extends FarmState {
  @override
  List<Object> get props => [];
}

class FarmEmpty extends FarmState{
  @override
  List<Object> get props => [];
}

class FarmPresent extends FarmState{
  List<Farm> farm;
  FarmPresent({ required this.farm});

  @override
  List<Object> get props => [farm];
}

class FarmSubmitSuccefuly extends FarmState{
  @override
  List<Object> get props => [];
}

class FarmSubmitFailed extends FarmState{
  @override
  List<Object> get props => [];
}
