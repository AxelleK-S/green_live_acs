part of 'data_manage_bloc.dart';

abstract class DataManageState extends Equatable {
  const DataManageState();
}

class DataManageInitial extends DataManageState {
 Data data ;
 List<Data> datas = [];
  DataManageInitial({required this.data, required  this.datas});
  @override
  List<Object> get props => [data, datas];
}

class NewDataState extends DataManageState{
  Data? data;
  NewDataState({required this.data});

  @override
  // TODO: implement props
  List<Object?> get props =>[data];
}
