import 'package:HydroGrow/Models/User.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  SharedPreferences sharedPreferences;

  Future<User> fetchUser(int id) async {
    String url = "http://localhost:8080/users/$id";

    final response = await http.get(url);
    var data = jsonDecode(response.body);
    print('-------------------');
    print(data);
    return User.fromJson(data);
  }

  Future<int> loginUser(String username, String password) async {
    var response = await http.post(
      'http://localhost:8080/users/login',
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );
    if (response.statusCode == 400) {
      print(response.body);
      return 0;
    } else {
      //print(int.parse(json.decode(response.body)["VendorID"].toString()));
      print(response.body);
      return (int.parse(json.decode(response.body)["SystemID"].toString()));
    }
  }

  Future<http.Response> signUpUser(
      {String name,
      String email,
      int systemID,
      String username,
      String password}) {
    return http.post(
      'http://localhost:8080/users',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "name": name,
        "email": email,
        "systemID": systemID,
        "username": username,
        "password": password,
      }),
    );
  }
}
