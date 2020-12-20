import 'package:HydroGrow/Services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UserViewModel.dart';

class LoginModelView extends ChangeNotifier {
  String username;
  String password;
  SharedPreferences sharedPreferences;

  LoginModelView();

  Future<int> login() async {
    final res = await UserServices().loginUser(username, password);
    if (res <= 0) return 0;
    var sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('UserID', res);
    await UserViewModel().fetchingUserInfo();
    notifyListeners();
    return res;
  }

  set uName(String uName) {
    username = uName;
    notifyListeners();
  }

  set pass(String pword) {
    password = pword;
    notifyListeners();
  }
}
