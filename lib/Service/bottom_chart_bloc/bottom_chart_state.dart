part of 'bottom_chart_bloc.dart';

abstract class BottomChartState extends Equatable {

   BottomChartState();

 late Widget  Function(double value , TitleMeta meta)  bottomTitleWidget;
}

class BottomChartInitial extends BottomChartState {
  @override
  List<Object> get props => [];
  BottomChartInitial(){
    super.bottomTitleWidget = bottomTitleWidgets;
  }
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = GoogleFonts.roboto(
      color: MyColors.primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    Widget text;
    //print(value.toInt());
    switch (value.toInt()) {
      case 1:
        text = Text('6h', style: style);
        break;
      case 10:
        text = Text('10h', style: style);
        break;
      case 17:
        text = Text('17h', style: style);
        break;
      case 23:
        text = Text('23h', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

}

class BottomChartDays extends BottomChartState {
  @override
  List<Object> get props => [];

  BottomChartDays(){
    super.bottomTitleWidget = bottomTitleWidgets;
  }
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = GoogleFonts.roboto(
      color: MyColors.primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    Widget text;
    //print(value.toInt());
    switch (value.toInt()) {
      case 1:
        text = Text('6h', style: style);
        break;
      case 10:
        text = Text('8h', style: style);
        break;
      case 15:
        text = Text('10h', style: style);
        break;
      case 24:
        text = Text('12h', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }


}

class BottomChartMonths extends BottomChartState {
  @override
  List<Object> get props => [];

  BottomChartMonths(){
    super.bottomTitleWidget = bottomTitleWidgets;
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = GoogleFonts.roboto(
      color: MyColors.primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    Widget text;
    //print(value.toInt());
    switch (value.toInt()) {
      case 1:
        text = Text('1J', style: style);
        break;
      case 10:
        text = Text('10J', style: style);
        break;
      case 20:
        text = Text('20J', style: style);
        break;
      case 28:
        text = Text('30J', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

}

class BottomChartYears extends BottomChartState {
  @override
  List<Object> get props => [];

  BottomChartYears(){
    super.bottomTitleWidget = bottomTitleWidgets;
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = GoogleFonts.roboto(
      color: MyColors.primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    Widget text;
    //print(value.toInt());
    switch (value.toInt()) {
      case 1:
        text = Text('J', style: style);
        break;
      case 4:
        text = Text('Avr', style: style);
        break;
      case 7:
        text = Text('Jll', style: style);
        break;
      case 12:
        text = Text('Dec', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }


}