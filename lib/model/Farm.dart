import 'package:cloud_firestore/cloud_firestore.dart';


class Farm {
  Farm({
      required this.cultureId,
      required this.kitId,
      required this.image,
      required this.location,
    required  this.name,
    required  this.state,
    required   this.superficie,
    required this.userId,
  });

  String? cultureId;
  String? kitId;
  String? image;
  String? location;
  String? name;
  String? state;
  int? superficie;
  String? userId;

  Farm.fromJson(dynamic json) {
    cultureId = json['Culture_id'];
    kitId = json['KitId'];
    image = json['image'];
    location = json['location'];
    name = json['name'];
    state = json['state'];
    superficie = json['superficie'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Culture_id'] = cultureId;
    map['KitId'] = kitId;
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

