import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:green_live_acs/model/Farm.dart';
import 'package:green_live_acs/repository/farm_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'farm_event.dart';
part 'farm_state.dart';

class FarmBloc extends Bloc<FarmEvent, FarmState> {
  FarmRepository farmRepository;


  FarmBloc(FirebaseFirestore db,{required this.farmRepository}) : super(FarmInitial()) {

    on<FarmBegin>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? id =await prefs.getString('email');

     Response response =  await farmRepository.GetFarmBYUserId(id!);
      List<Farm> farms = [];

      if(response.statusCode == 200) {
       List<dynamic> data = response.data;

       // Parcourez les données et convertissez-les en objets Farm
       for (var farmData in data) {
         Farm farm = Farm.fromJson(farmData);

         farms.add(farm);
       }

       emit(FarmPresent(farm: farms));


       //   print("farms is present guys ${farm.length}");

       // emit(FarmPresent(farm : farm));
       // TODO: implement event handler
     }

    });

    on<NewFarms>((event, emit) => {
      emit(FarmInitial())
    });


  }
}
