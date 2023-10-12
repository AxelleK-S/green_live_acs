import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/src/response.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../model/Farm.dart';
import '../persistence/Api.dart';

class FarmRepository {
  FirebaseFirestore db;
  //Storage storage;
  FirebaseStorage storage;

  Api api ;
  final  bucketId = '64fb4704b29cd32abb0c';
  FarmRepository({required this.db, required this.storage , required this.api});

  Future<Response> GetFarmBYUserId(String id) async {
    List<Farm>? Farmlist = [];

    //CollectionReference farmsRef = db.collection('Farm');
    // await farmsRef.where('userId', isEqualTo: id).get().then((snapshot) {
    //   // Itère sur les documents dans la snapshot.
    //   for (var doc in snapshot.docs) {
    //     Farmlist?.add(Farm.fromJson(((doc.data() as Map))));
    //     print(Farmlist?[0].name);
    //   }
    // });

    return await api.get('/farm/get-farms-byID/${id}');

  }

  Future<Farm> AddFarm(Farm farm, File image) async {

      final uploadTask = this.storage.ref().child(image.path).putFile(image);
      final uploadSnapshot = await uploadTask;
      final downloadURL = await uploadSnapshot.ref.getDownloadURL();
      farm.image = downloadURL;


      final response = await api.postFarms('/farm/create', farm);
      print(response.data);
      final createdFarm = Farm.fromJson(response.data);

    //  db.collection('Farm').add(createdFarm.toJson());
      return createdFarm ;

    //
    //   await  this.storage.ref().child(image.path)
    //  .putFile(image).then((p0) => {
    //       p0.ref.getDownloadURL().then((value) => {
    //             farm.image = value,
    //      //   print(" qwerty fd sf sd fds ${farm.farmsId} "),
    //        api.postFarms('/farm/create', farm).then((value) => Farm.fromJson(value.data)),
    //
    //           db.collection('Farm').add(farm.toJson())
    //       })
    // });

  }
}
