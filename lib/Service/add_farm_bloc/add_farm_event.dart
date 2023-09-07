part of 'add_farm_bloc.dart';

abstract class AddFarmEvent extends Equatable {
  const AddFarmEvent();
}

class FarmCreate extends AddFarmEvent{
Farm farm ;

FarmCreate({required this.farm});
@override
// TODO: implement props
List<Object?> get props => [];
}
