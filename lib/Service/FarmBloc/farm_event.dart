part of 'farm_bloc.dart';

abstract class FarmEvent extends Equatable {
  const FarmEvent();
}
class FarmBegin extends FarmEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class NewFarms extends FarmEvent{

  Farm farm;

  NewFarms({required this.farm});
  @override
  // TODO: implement props
  List<Object?> get props => [farm];

}


