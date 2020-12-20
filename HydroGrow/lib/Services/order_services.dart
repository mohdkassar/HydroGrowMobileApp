import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrderServices {
  SharedPreferences sharedPreferences;

  Future<http.Response> createOrder(
      {String city,
      String address,
      bool solution1,
      bool solution2,
      bool acidSolution,
      String systemID}) {
    return http.post(
      'http://localhost:8080/orders',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "cty": city,
        "address": address,
        "systemID": systemID,
        "order": {
          "Solution 1": solution1,
          "Solution 2": solution2,
          "Acid Solution": acidSolution,
        }
      }),
    );
  }
}
