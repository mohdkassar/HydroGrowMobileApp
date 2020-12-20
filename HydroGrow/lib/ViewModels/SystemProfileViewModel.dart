import 'dart:convert';

import 'package:HydroGrow/Services/system_services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SystemProfileViewModel extends ChangeNotifier {
  bool systemStatus = true;
  double stockSolution1 = 0.3;
  double stockSolution2 = 0.7;
  double acidSolution = 0.60;
  double baseSolution = 0.45;

  Future<void> getSystemData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    int systemID = sharedPreferences.getInt('SystemID');
    Response response =
        await SystemServices().getSystemData(systemID.toString());
    var data = json.decode(response.body);
    stockSolution1 = data["Solution 1"] / 100;
    stockSolution2 = data["Solution 2"] / 100;
    acidSolution = data["Solution 3"] / 100;
    if (data["System Status"].toString().contains("OPR"))
      systemStatus = true;
    else
      systemStatus = false;
    notifyListeners();
  }
}
