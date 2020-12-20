import 'package:HydroGrow/Models/Plants.dart';

class PlantViewModel {
  final Plant plant;

  PlantViewModel({this.plant});

  String get plantName {
    return this.plant.plantName;
  }

  String get plantID {
    return this.plant.plantID;
  }
}
