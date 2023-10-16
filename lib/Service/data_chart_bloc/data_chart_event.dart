part of 'data_chart_bloc.dart';

abstract class DataChartEvent extends Equatable {
  String period = "";
  
   DataChartEvent({required this.period});
}

class DataChartHumidyEvent extends DataChartEvent{
  DataChartHumidyEvent({required super.period});


  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DataChartPhEvent extends DataChartEvent{
  DataChartPhEvent({required super.period});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DataChartSoilsEvent extends DataChartEvent {
  DataChartSoilsEvent({required super.period});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
  
