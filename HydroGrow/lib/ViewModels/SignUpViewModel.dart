import 'package:HydroGrow/Services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UserViewModel.dart';

class SignUpViewModel extends ChangeNotifier {
  String username = "";
  int systemID = 0;
  String email = "";
  String password = "";
  String name = "";

  SignUpViewModel();

  set uName(String uName) {
    username = uName;
    notifyListeners();
  }

  set fName(String fName) {
    name = fName;
    notifyListeners();
  }

  set eemail(String eemail) {
    email = eemail;
    notifyListeners();
  }

  set id(int id) {
    systemID = id;
    notifyListeners();
  }

  set pass(String pword) {
    password = pword;
    notifyListeners();
  }

  bool checkIfEmpty() {
    print("I am in the checkIfEmpty method");
    if (name != "" && systemID != 0 && password != "" && email != "") {
      print("I am in the checkIfEmpty method: checked");
      return true;
    } else
      return false;
  }

  Future<void> signUp() async {
    await UserServices().signUpUser(
        email: email,
        name: name,
        password: password,
        systemID: systemID,
        username: username);
    var sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('SystemID', systemID);
    await UserViewModel().fetchingUserInfo();
    notifyListeners();
  }
}
