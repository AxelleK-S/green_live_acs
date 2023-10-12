class Data {
  Data({
      required this.ph,
      required this.humidity,
      required this.soils,
      required this.kitId,
      required this.kitIds,});

  Data.fromJson(dynamic json) {
    ph = json['ph'];
    humidity = json['humidity'];
    soils = json['soils'];
    kitId = json['kitId'];
    kitIds = json['kit_ids'];
  }
  int? ph;
  int? humidity;
  int? soils;
  String ?kitId;
  String ?kitIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ph'] = ph;
    map['humidity'] = humidity;
    map['soils'] = soils;
    map['kitId'] = kitId;
    map['kit_ids'] = kitIds;
    return map;
  }

}