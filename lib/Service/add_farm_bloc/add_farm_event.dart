part of 'add_farm_bloc.dart';

abstract class AddFarmEvent extends Equatable {
  const AddFarmEvent();
}

class FarmCreate extends AddFarmEvent{
  final File image;
Farm farm ;

FarmCreate({required this.farm, required this.image});
@override
// TODO: implement props
List<Object?> get props => [];
}

class Init extends AddFarmEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}