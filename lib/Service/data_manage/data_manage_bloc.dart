import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/Data.dart';
import '../web_socket/server.dart';

part 'data_manage_event.dart';
part 'data_manage_state.dart';

class DataManageBloc extends Bloc<DataManageEvent, DataManageState> {
  Server server = new Server();
  late String credentials ;

  DataManageBloc() : super(DataManageInitial(data: Data(ph: 0, humidity: 0, soils: 0, kitId: "", kitIds: ""))) {
   // int i=1;
    this.server.conection();
    this.server.getStream().listen((message) {
      print(message);
      try{
        Data data = Data.fromJson(message);

        emit(DataManageInitial(data: data));
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
      this.server.sendCredentials(event.credentials)

    });
  }
}


