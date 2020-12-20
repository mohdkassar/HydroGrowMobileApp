import 'dart:convert';

import 'package:HydroGrow/Services/system_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPlantsViewModel extends ChangeNotifier {
  String pH1 = "";
  String pH2 = "";
  String ec1 = "";
  String ec2 = "";
  String waterLevel1 = "";
  String waterLevel2 = "";
  String temperature1 = "";
  String temperature2 = "";
  String plantName1 = '';
  String plantName2 = '';
  int stage1 = 0;
  int stage2 = 0;
  String imageTray1 = "";
  String imageTray2 = "";

  Future<void> getSystemData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    int systemID = sharedPreferences.getInt('SystemID');
    Response response =
        await SystemServices().getSystemData(systemID.toString());
    var data = json.decode(response.body);
    var tray1 = data['data'][0];
    var tray2 = data['data'][1];
    pH1 = tray1['pH'].toString();
    pH2 = tray2['pH'].toString();
    ec1 = tray1['EC'].toString();
    ec2 = tray2['EC'].toString();
    waterLevel1 = tray1['Water Level'].toString();
    waterLevel2 = tray2['Water Level'].toString();
    temperature1 = tray1['Temperature'].toString();
    temperature2 = tray2['Temperature'].toString();
    plantName1 = tray1['PlantName'];
    plantName2 = tray2['PlantName'];
    imageTray1 = tray1['filePath'];
    imageTray2 = tray2['filePath'];
    print(imageTray1);
    notifyListeners();
  }
}
