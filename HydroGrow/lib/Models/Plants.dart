class Plant {
  String plantID;
  String plantName;

  Plant({this.plantID, this.plantName});
  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(plantID: json['_id'], plantName: json['plant_name']);
  }
}
