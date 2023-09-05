import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/Farm.dart';

class FarmRepository{
  FirebaseFirestore db;
  FarmRepository({required this.db});

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

  Future<void> AddFarm(Farm farm) async {
    await db.collection('Farm').add(farm.toJson());
  }
}