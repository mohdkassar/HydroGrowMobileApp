import 'package:HydroGrow/Services/order_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderViewModel extends ChangeNotifier {
  String city = "";
  String address = "";
  bool solution1 = false;
  bool solution2 = false;
  bool acidSolution = false;

  Future<int> getIdFromShared() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt('SystemID');
  }

  void handleSolution1() {
    solution1 = !solution1;
    notifyListeners();
  }

  void handleSolution2() {
    solution2 = !solution2;
    notifyListeners();
  }

  void handleSolution3() {
    acidSolution = !acidSolution;
    notifyListeners();
  }

  Future<void> createOrder() async {
    int userID = await getIdFromShared();
    print('object');
    await OrderServices().createOrder(
        acidSolution: acidSolution,
        address: address,
        city: city,
        solution1: solution1,
        solution2: solution2,
        systemID: userID.toString());
    notifyListeners();
  }
}
