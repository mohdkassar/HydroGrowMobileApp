import 'package:HydroGrow/Services/system_services.dart';
import 'package:HydroGrow/ViewModels/PlantViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SystemSetUpViewModel extends ChangeNotifier {
  List<DropdownMenuItem> plantProfilesDropDown = new List<DropdownMenuItem>();
  List<PlantViewModel> plantProfiles = List<PlantViewModel>();
  String tray1ID = "";
  String tray2ID = "";

  Future<void> fetchPlantProfiles() async {
    final response = await SystemServices().fetchPlantProfiles();

    if (response != null) {
      this.plantProfiles.addAll(response.map((plantProfile) {
            return PlantViewModel(plant: plantProfile);
          }).toList());

      for (int i = 0; i < plantProfiles.length; i++) {
        print(plantProfiles[i].plant.plantName);
        plantProfilesDropDown.add(new DropdownMenuItem(
          child: Text(plantProfiles[i].plant.plantName),
          value: plantProfiles[i].plant.plantName,
        ));
      }
    }
    notifyListeners();
  }

  Future<int> getIdFromShared() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt('SystemID');
  }

  Future<void> systemSetUp() async {
    int userID = await getIdFromShared();
    await SystemServices().systemSetUp(userID.toString(), tray1ID, tray2ID);
  }
}
