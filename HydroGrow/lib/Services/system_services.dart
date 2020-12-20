import 'package:HydroGrow/Models/Plants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SystemServices {
  Future<List<Plant>> fetchPlantProfiles() async {
    String url = "http://localhost:8080/plants";

    final response = await http.get(url);
    var data = jsonDecode(response.body);
    List<Plant> plantProfiles = new List<Plant>();

    for (int i = 0; i < data.length; i++) {
      Plant plant = Plant.fromJson(data[i]);
      plantProfiles.add(plant);
    }
    print(data[0]);
    return plantProfiles;
  }

  Future<void> systemSetUp(String userid, String tray1, String tray2) async {
    String url = "http://localhost:8080/users/system_setup/$userid";

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "tray1": tray1,
        "tray2": tray2,
      }),
    );
    var data = jsonDecode(response.body);
    print(data);
  }

  Future<dynamic> getSystemData(String userID) async {
    String url = "http://localhost:8080/system_data/$userID";
    final response = await http.get(url);
    //print(response.body);
    return response;
  }
}
