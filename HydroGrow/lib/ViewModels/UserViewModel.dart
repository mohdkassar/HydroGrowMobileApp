import 'package:HydroGrow/Models/User.dart';
import 'package:HydroGrow/Services/user_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  User user = new User();

  int get id {
    return this.user.systemID;
  }

  String get password {
    return this.user.password;
  }

  String get email {
    return this.user.email;
  }

  String get name {
    return this.user.name;
  }

  String get username {
    return this.user.userName;
  }

  Future<int> getIdFromShared() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt('SystemID');
  }

  Future fetchingUserInfo() async {
    int userID = await getIdFromShared();
    print("Before check $userID");
    if (userID == null) return;
    if (userID <= 0) return;
    print("After check $userID");
    final response = await UserServices().fetchUser(userID);
    user.systemID = response.systemID;
    user.name = response.name;
    user.email = response.email;
    user.password = response.password;
    user.userName = response.userName;

    notifyListeners();
  }

  void resetStoredUser() {
    user.name = null;
    user.systemID = null;
    user.email = null;
    user.userName = null;
    user.password = null;
  }
}
