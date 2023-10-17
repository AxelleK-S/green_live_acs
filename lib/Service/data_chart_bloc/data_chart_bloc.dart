import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:green_live_acs/env.dart';
import 'package:green_live_acs/model/Data.dart';
import 'package:green_live_acs/repository/data_repository.dart';

import '../../persistence/Api.dart';

part 'data_chart_event.dart';
part 'data_chart_state.dart';

class DataChartBloc extends Bloc<DataChartEvent, DataChartState> {
  Api api = Api(baseUrl: api_url);
  String credentials;
  bool load = false ;
  late DataRepository dataRepository;
  late List<dynamic> datas = [];
  DataChartBloc({required this.credentials})
      : super(DataChartHumidityState(datas: [], MaxX: 12)) {
    dataRepository = DataRepository(api: api);
    on<DataChartHumidyEvent>((event, emit) async {
      if(!load){
        Response rep = await dataRepository.GetDataBYUserId(credentials);
        if (rep.statusCode == 200) {
          datas = rep.data!.map((e) => Data.fromJson(e)).toList() ;
          print(datas);
          load = true ;

        }

      }

      List<dynamic> d = [];
      if (event.period == "Day") {
        d = datas
            .where((element) => element.dateTime!
                .isAfter(DateTime.now().subtract(Duration(hours: 5))))
            .map((e) {
              print(e.dateTime!.hour);
             return [e.humidity, e.dateTime?.hour];
        })
            .toList();
        List <dynamic> s_d = [];
        num length = s_d.length / 5 ;
        for(int i =1  ; i <=5 ; i++){
          num a = 0;
          s_d.add(d[i][0]);
          a = a+length ;
        }
        emit(DataChartHumidityState(datas: s_d, MaxX: 24));

      } else if (event.period == "Month") {
        d = datas
            .where((element) => element.dateTime!
                .isAfter(DateTime.now().subtract(Duration(days: 28))))
            .map((e) => [e.humidity, e.dateTime?.day])
            .toList();
        List <dynamic> s_d = [];
        num length = s_d.length / 5 ;
        for(int i =1  ; i <=5 ; i++){
          num a = 0;
          s_d.add(d[i][0]);
          a = a+length ;
        }
        emit(DataChartHumidityState(datas: s_d, MaxX: 28));

      } else if (event.period == "Year") {
        d = datas
            .where((element) => element.dateTime!
                .isAfter(DateTime.now().subtract(Duration(days: 365))))
            .map((e) => [e.humidity, e.dateTime?.month])
            .toList();
        List <dynamic> s_d = [];
        num length = s_d.length / 5 ;
        for(int i =1  ; i <=5 ; i++){
          num a = 0;
          s_d.add(d[i][0]);
          a = a+length ;
        }
        emit(DataChartHumidityState(datas: s_d, MaxX: 12));

      }


      // TODO: implement event handler
    });

    on<DataChartPhEvent>((event, emit) async {
      if(!load){
        Response rep = await dataRepository.GetDataBYUserId(credentials);
        if (rep.statusCode == 200) {
          datas = rep.data!.map((e) => Data.fromJson(e)).toList() ;
          print(datas);
          load = true ;

        }

      }

      List<dynamic> d = [];
      if (event.period == "Day") {
        d = datas
            .where((element) => element.dateTime!
                .isAfter(DateTime.now().subtract(Duration(hours: 5))))
            .map((e) => [e.ph, e.dateTime?.hour])
            .toList();
        List <dynamic> s_d = [];
        num length = s_d.length / 5 ;
        for(int i =1  ; i <=5 ; i++){
          num a = 0;
          s_d.add(d[i][0]);
          a = a+length ;
        }
        emit(DataChartPhState(datas: s_d, MaxX: 24));


      } else if (event.period == "Month") {
        d = datas
            .where((element) => element.dateTime!
                .isAfter(DateTime.now().subtract(Duration(days: 28))))
            .map((e) => [e.ph, e.dateTime?.day])
            .toList();
        List <dynamic> s_d = [];
       num length = s_d.length / 5 ;
        for(int i =1  ; i <=5 ; i++){
          num a = 0;
          s_d.add(d[i][0]);
          a = a+length ;
        }

        emit(DataChartPhState(datas: s_d, MaxX: 28));


      } else if (event.period == "Year") {
        d = datas
            .where((element) => element.dateTime!
                .isAfter(DateTime.now().subtract(Duration(days: 365))))
            .map((e) => [e.ph, e.dateTime?.month])
            .toList();
        List <dynamic> s_d = [];
        num length = s_d.length / 5 ;
        for(int i =1  ; i <=5 ; i++){
          num a = 0;
          s_d.add(d[i][0]);
          a = a+length ;
        }
        emit(DataChartPhState(datas: s_d, MaxX: 12));

      }

    });

    on<DataChartSoilsEvent>((event, emit) async {
      if(!load){
        Response rep = await dataRepository.GetDataBYUserId(credentials);
        if (rep.statusCode == 200) {
          datas = rep.data!.map((e) => Data.fromJson(e)).toList() ;
          print(datas);
          load = true ;

        }

      }

      List<dynamic> d = [];
      if (event.period == "Day") {
        d = datas
            .where((element) => element.dateTime!
                .isAfter(DateTime.now().subtract(Duration(hours: 5))))
            .map((e) => [e.soils, e.dateTime?.hour])
            .toList();
        List <dynamic> s_d = [];
        num length = s_d.length / 5 ;
        for(int i =1  ; i <=5 ; i++){
          num a = 0;
          s_d.add(d[i][0]);
          a = a+length ;
        }
        emit(DataChartSoilsState(datas: s_d, MaxX: 24));

      } else if (event.period == "Month") {
        d = datas
            .where((element) => element.dateTime!
                .isAfter(DateTime.now().subtract(Duration(days: 28))))
            .map((e) => [e.soils, e.dateTime?.day])
            .toList();
        List <dynamic> s_d = [];
        num length = s_d.length / 5 ;
        for(int i =1  ; i <=5 ; i++){
          num a = 0;
          s_d.add(d[i][0]);
          a = a+length ;
        }
        emit(DataChartSoilsState(datas: s_d, MaxX: 28));

      } else if (event.period == "Year") {
        d = datas
            .where((element) => element.dateTime!
                .isAfter(DateTime.now().subtract(Duration(days: 365))))
            .map((e) => [e.soils, e.dateTime?.month])
            .toList();
        List <dynamic> s_d = [];
        num length = s_d.length / 5 ;
        for(int i =1  ; i <=5 ; i++){
          num a = 0;
          s_d.add(d[i][0]);
          a = a+length ;
        }
        print(s_d);
        emit(DataChartSoilsState(datas: s_d, MaxX: 12));

      }
    });

    // on<DataChat>((event, emit) {
    //
    // })
  }
}
