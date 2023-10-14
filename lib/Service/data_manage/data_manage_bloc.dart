import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:green_live_acs/repository/data_repository.dart';

import '../../model/Data.dart';
import '../web_socket/server.dart';

part 'data_manage_event.dart';
part 'data_manage_state.dart';

class DataManageBloc extends Bloc<DataManageEvent, DataManageState> with WidgetsBindingObserver {
  Server server;
  DataRepository dataRepository;
  late String credentials ;
  VoidCallback func ;
List<Data> datas = [];
  DataManageBloc({required this.dataRepository , required this.server , required this.func}) : super(DataManageInitial(data: Data(ph: 0, humidity: 0, soils: 0, kitId: "", kitIds: ""), datas: [])) {
   // int i=1;
    func();
    this.server.getStream().listen((message) async {
      print(message);
      try{
        Data data = Data.fromJson(JsonDecoder().convert(message));
        //print("ok");
        var response = await dataRepository.GetDataBYUserId(credentials);
        if(response.statusCode == 200){
          List<dynamic> datas = response.data;
          this.datas = datas.map((e) => Data.fromJson(e)).toList();
          print(datas);
          if(data.dateTime!.isAfter(DateTime.now().subtract(Duration(hours: 5)))){
            this.datas = this.datas
            .where((element) => element.dateTime!.isAfter(DateTime.now().subtract(Duration(hours: 8)))).toList();
            print("hold data");
          }
        }
        emit(DataManageInitial(data: data , datas: datas));
      }catch(e){
        print(e);
      }

      if(message.toString() == "GET_CREDENTIALS"){

        //emit(DataManageInitial(id: i));
     //   i++;

        //this.server.sendCredentials(event.credentials);

      }
    });

    on<DataManageLoadEvent>((event, emit) {
      // TODO: implement event handler

    });



    on<DataManageRenewCredential>((event, emit) =>{
      //this.server.askCredentials(),
      credentials = event.credentials!,
      this.server.sendCredentials(event.credentials)


    });

    on<DataManageDayEvent>((event, emit) {
      // TODO: implement event handler

    });
  }


}




