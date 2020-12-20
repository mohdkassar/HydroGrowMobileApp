import 'package:HydroGrow/ViewModels/LoginViewModel.dart';
import 'package:HydroGrow/utils/Widgets/ButtonWidget.dart';
import 'package:HydroGrow/utils/Widgets/LogoWidget.dart';
import 'package:HydroGrow/utils/Widgets/ToastWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//to improve:
/*there is extra padding between the checkbox and its text; I couldn't know how to reduce it
* once click on forgotpassword, it navigates to the next screen. same thing to CreateOne.
* Create account Button should navigate to the dashboard.
* */
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  SharedPreferences sharedPreferences;
  TextEditingController usernameController;
  TextEditingController passwordController;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      sharedPreferences = value;
      print(value.getInt("SystemID"));
      if (value.getInt("SystemID") != null && value.getInt("SystemID") != 0)
        Navigator.pushReplacementNamed(context, '/');
    });
    usernameController = new TextEditingController();
    passwordController = new TextEditingController();

    super.initState();
  }

  void setHidePassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('============LOGIN SCREEN============');
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Consumer<LoginModelView>(
            builder: (context, vm, child) => Column(
              children: <Widget>[
                Logo(),
                new Container(
                  margin: EdgeInsets.fromLTRB(40, 35, 40, 5),
                  child: TextFormField(
                    onChanged: (value) => vm.username = value,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(fontSize: 0.035 * width),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 12.0, top: 6.0, bottom: 6.0, right: 0.0),
                    ),
                    keyboardType: TextInputType.name,
                    controller: usernameController,
                  ),
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 40, 5),
                  child: TextFormField(
                    controller: passwordController,
                    onChanged: (value) => vm.password = value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 0.035 * width),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      suffixIcon: IconButton(
                        onPressed: setHidePassword,
                        icon: hidePassword
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 12.0, top: 6.0, bottom: 6.0, right: 0.0),
                    ),
                    obscureText: hidePassword,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ButtonWidget(
                  buttonText: "Login",
                  onPress: () async {
                    print(vm.username);
                    print(vm.password);
                    if (vm.username != "" && vm.password != null) {
                      vm.login().then((value) {
                        if (value > 0) {
                          Navigator.pushReplacementNamed(context, '/');
                        } else {
                          print('000');
                          ToastWidget(
                            context: context,
                            toastMessage: "Incorrect username or password",
                          );
                        }
                      });
                    }
                  },
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account?  ",
                      style: TextStyle(
                          fontSize: 0.035 * width, color: Colors.black),
                      children: [
                        TextSpan(
                            text: "Create One.",
                            style: TextStyle(
                                fontSize: 0.035 * width,
                                fontWeight: FontWeight.bold),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, '/signUp');
                              }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
