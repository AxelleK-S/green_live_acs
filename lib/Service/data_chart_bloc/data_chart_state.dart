part of 'data_chart_bloc.dart';

abstract class DataChartState extends Equatable {
  const DataChartState();
}

class DataChartInitial extends DataChartState {
  List <dynamic> datas;
  DataChartInitial({required this.datas});
  @override
  List<Object> get props => [datas];
}


