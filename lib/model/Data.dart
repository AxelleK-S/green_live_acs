class Data {
  Data({
      required this.ph,
      required this.humidity,
      required this.soils,
      required this.kitId,
      required this.kitIds,});

  Data.fromJson(dynamic json) {
    ph = json['ph']?.toDouble();
    humidity = json['humidity']?.toDouble();
    soils = json['soils']?.toDouble();
    kitId = json['kitId'];
    kitIds = json['kit_ids'];
    dateTime = json['dateTime'] != null ? DateTime.parse(json['dateTime']) : null;
  }
  double? ph;
  double? humidity;
  double? soils;
  dynamic ?kitId;
  dynamic ?kitIds;
  DateTime? dateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ph'] = ph;
    map['humidity'] = humidity;
    map['soils'] = soils;
    map['kitId'] = kitId;
    map['kit_ids'] = kitIds;
    map['date'] = dateTime;
    return map;
  }

}