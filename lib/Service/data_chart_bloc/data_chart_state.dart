part of 'data_chart_bloc.dart';

abstract class DataChartState extends Equatable {
  List <dynamic> datas;
  late double MaxY ;
  double MaxX ;
  late String title ;
   late Widget Function(double value , TitleMeta meta)  leftTitleWidget;

     //print(value.toInt());


   DataChartState({required this.datas , required this.MaxX});
}

class DataChartInitial extends DataChartState {
  DataChartInitial({ required super.datas, required super.MaxX}){
     super.leftTitleWidget = leftTitleWidgets;
  }
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = GoogleFonts.roboto(
      color: MyColors.primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
      case 15:
        text = '10L';
        break;
      case 30:
        text = '20L';
        break;
      case 45:
        text = '50L';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  @override
  List<Object> get props => [datas];
}

class DataChartHumidityState extends DataChartState {
 // List <dynamic> datas;
  DataChartHumidityState({ required super.datas, required super.MaxX}){
    super.MaxY = 50;
    super.title = "Humidity";
    super.leftTitleWidget = leftTitleWidgets ;
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = GoogleFonts.roboto(
      color: MyColors.primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
      case 15:
        text = '10L';
        break;
      case 30:
        text = '20L';
        break;
      case 45:
        text = '50L';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  @override
  List<Object> get props => [datas];
}



class DataChartSoilsState extends DataChartState {
  DataChartSoilsState({required super.datas, required super.MaxX}){
    super.MaxY = 100 ;
    super.title = "Soils";
    super.leftTitleWidget = leftTitleWidgets ;
  }
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = GoogleFonts.roboto(
      color: MyColors.primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
      case 20:
        text = '20L';
        break;
      case 40:
        text = '40L';
        break;
      case 60:
        text = '60L';
        break;
      case 100 :
        text = "100L";
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }


  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class DataChartPhState extends DataChartState {
  DataChartPhState({required super.datas, required super.MaxX}){
    super.MaxY = 14 ;
    super.title = "Ph";
    super.leftTitleWidget = leftTitleWidgets ;
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = GoogleFonts.roboto(
      color: MyColors.primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1';
      case 3:
        text = '3';
        break;
      case 6:
        text = '6';
        break;
      case 8:
        text = '8';
        break;
        case 14 :
          text = "14";
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }


  @override
  // TODO: implement props
  List<Object?> get props => [];

}
