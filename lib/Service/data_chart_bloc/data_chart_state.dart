part of 'data_chart_bloc.dart';

abstract class DataChartState extends Equatable {
  List <dynamic> datas;
  late double MaxY ;
  double MaxX ;
  late String title ;

   DataChartState({required this.datas , required this.MaxX});
}

class DataChartInitial extends DataChartState {
  DataChartInitial({ required super.datas, required super.MaxX}){

  }
  @override
  List<Object> get props => [datas];
}

class DataChartHumidityState extends DataChartState {
 // List <dynamic> datas;
  DataChartHumidityState({ required super.datas, required super.MaxX}){
    super.MaxY = 50;
    super.title = "Humidity";
  }
  @override
  List<Object> get props => [datas];
}



class DataChartSoilsState extends DataChartState {
  DataChartSoilsState({required super.datas, required super.MaxX}){
    super.MaxY = 100 ;
    super.title = "Soils";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class DataChartPhState extends DataChartState {
  DataChartPhState({required super.datas, required super.MaxX}){
    super.MaxY = 14 ;
    super.title = "Ph";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
