part of 'add_farm_bloc.dart';

abstract class AddFarmState extends Equatable {
  late Widget state ;
   AddFarmState({required this.state});
}

class AddFarmInitial extends AddFarmState {
  AddFarmInitial({required super.state});

  @override
  List<Object> get props => [super.state];
}

class AddFarmPressed extends AddFarmState {
  AddFarmPressed({required super.state});

  @override
  List<Object> get props => [super.state];
}

class AddFarmBegin extends AddFarmState {
  AddFarmBegin({required super.state});

  @override
  List<Object> get props => [super.state];
}

class AddFarmSuccess extends AddFarmState {
  AddFarmSuccess({required super.state});

  @override
  List<Object> get props => [super.state];
}

class AddFarmFailed extends AddFarmState {
  String e;
  AddFarmFailed({required super.state, required  this.e});

  @override
  List<Object> get props => [super.state];
}
