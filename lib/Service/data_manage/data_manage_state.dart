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
     case 20:
       text = Text('10h', style: style);
       break;
     case 28:
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

class NewDataState extends DataManageState{
  Data? data;
  NewDataState({required this.data});

  @override
  // TODO: implement props
  List<Object?> get props =>[data];
}
