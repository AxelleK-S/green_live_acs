part of 'data_manage_bloc.dart';

abstract class DataManageState extends Equatable {
  const DataManageState();
}

class DataManageInitial extends DataManageState {
 Data data ;
  DataManageInitial({required this.data});
  @override
  List<Object> get props => [data ];
}

class NewDataState extends DataManageState{
  Data? data;
  NewDataState({required this.data});

  @override
  // TODO: implement props
  List<Object?> get props =>[data];
}
