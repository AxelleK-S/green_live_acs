import 'package:cloud_firestore/cloud_firestore.dart';


class Farm {

  Farm({

    required this.cultureId,
       this.kitId,
       this.image,
       this.location,
        //this.farmsId,

      required this.name,
    required  this.state,
    required   this.superficie,
    required this.userId,
  });

//  String? farmsId;

  String? cultureId;
  String? kitId;
  String? image;
  String? location;
  String? name;
  String? state;
  String? superficie;
  String? userId;

  Farm.fromJson(dynamic json) {
    cultureId = json['culture_id'];
    kitId = json['kitId'];
    image = json['image'];
    location = json['location'];
    name = json['name'];
    state = json['state'];
    superficie = json['superficie'];
    userId = json['userId'];
   // farmsId = json['farmsId'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['culture_id'] = cultureId;
   // map['farmsId'] = farmsId;
    map['kitId'] = kitId;
    map['image'] = image;
    map['location'] = location;
    map['name'] = name;
    map['state'] = state;
    map['superficie'] = superficie;
    map['userId'] = userId;
    return map;
  }
  static Future<List<Farm>> GetFarmBYUserId(String id , db ) async {
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
}

