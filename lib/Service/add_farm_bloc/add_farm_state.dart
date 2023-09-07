part of 'add_farm_bloc.dart';

abstract class AddFarmState extends Equatable {
  late Widget state ;
   AddFarmState({required this.state});
}

class AddFarmInitial extends AddFarmState {
  AddFarmInitial({required super.state});

  @override
  List<Object> get props => [];
}

class AddFarmPressed extends AddFarmState {
  AddFarmPressed({required super.state});

  @override
  List<Object> get props => [];
}

class AddFarmBegin extends AddFarmState {
  AddFarmBegin({required super.state});

  @override
  List<Object> get props => [];
}

class AddFarmSuccess extends AddFarmState {
  AddFarmSuccess({required super.state});

  @override
  List<Object> get props => [];
}

class AddFarmFailed extends AddFarmState {
  AddFarmFailed({required super.state});

  @override
  List<Object> get props => [];
}
