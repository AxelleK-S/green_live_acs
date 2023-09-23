import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../model/Farm.dart';

class FarmRepository {
  FirebaseFirestore db;
  //Storage storage;
  FirebaseStorage storage;
  final  bucketId = '64fb4704b29cd32abb0c';
  FarmRepository({required this.db, required this.storage});

  Future<List<Farm>> GetFarmBYUserId(String id) async {
    CollectionReference farmsRef = db.collection('Farm');
    List<Farm>? Farmlist = [];
    await farmsRef.where('userId', isEqualTo: id).get().then((snapshot) {
      // Itère sur les documents dans la snapshot.
      for (var doc in snapshot.docs) {
        Farmlist.add(Farm.fromJson(((doc.data() as Map))));
        print(Farmlist[0].name);
      }
    });

    return Farmlist;
  }

  Future<void> AddFarm(Farm farm, File image) async {
    // final file = await storage.createFile(
    //   bucketId: bucketId,
    //   fileId: ID.unique(),
    //   file: InputFile.fromPath(path: image.path, filename: image.path.split('/').last),
    //   permissions: [
    //     Permission.read(Role.any()),
    //       Permission.write(Role.any()),
    //     Permission.update(Role.any()),
    //     Permission.write(Role.any())
    //   ]
    // );


    //
    //  Future  resultFile =   this.storage.getFileDownload(bucketId:bucketId , fileId:  file.$id);
    //  print('het : ${resultFile}');
    //  resultFile.then((value) => {
    //
    //  });
    // farm.image = resultFile.toString();
    // db.collection('Farm').add(farm.toJson());



 await  this.storage.ref().child(image.path)
     .putFile(image).then((p0) => {
          p0.ref.getDownloadURL().then((value) => {
                farm.image = value,
           db.collection('Farm').add(farm.toJson())
          })
    });

  }
}
