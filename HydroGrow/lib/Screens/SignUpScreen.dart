import 'package:HydroGrow/ViewModels/SignUpViewModel.dart';
import 'package:HydroGrow/utils/Widgets/ButtonWidget.dart';
import 'package:HydroGrow/utils/Widgets/LogoWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hidePassword = true;

  void setHidePassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('============SIGN UP SCREEN============');
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: (700 / 812) * height,
                color: Color(0xffF4F4F4),
                child: Column(
                  children: [
                    Logo(),
                    Container(
                      child: Consumer<SignUpViewModel>(
                        builder: (context, vm, child) => Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(13.0),
                                color: Color(0xffF4F4F4),
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                      color: Colors.grey[500],
                                      blurRadius: 4.0, // soften the shadow
                                      spreadRadius: 1.0, //extend the shadow
                                      offset: Offset(
                                        4.0,
                                        // Move to right 10  horizontally
                                        6.0, // Move to bottom 10 Vertically
                                      )),
                                ],
                              ),
                              margin: EdgeInsets.fromLTRB(
                                  (40 / 375) * width,
                                  (25 / 812) * height,
                                  (40 / 375) * width,
                                  (5 / 812) * height),
                              child: TextFormField(
                                onChanged: (value) {
                                  vm.name = value;
                                },
                                decoration: InputDecoration(
                                  labelText:
                                      vm.name != '' ? vm.name : "Full Name",
                                  labelStyle:
                                      TextStyle(fontSize: 0.035 * width),
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(13.0),
                                    borderSide: new BorderSide(),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: (12 / 375) * width,
                                      top: (6 / 812) * height,
                                      bottom: (6 / 812) * height),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            new Container(
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(13.0),
                                color: Color(0xffF4F4F4),
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                      color: Colors.grey[500],
                                      blurRadius: 4.0, // soften the shadow
                                      spreadRadius: 1.0, //extend the shadow
                                      offset: Offset(
                                        4.0,
                                        // Move to right 10  horizontally
                                        6.0, // Move to bottom 10 Vertically
                                      )),
                                ],
                              ),
                              margin: EdgeInsets.fromLTRB(
                                  (40 / 375) * width,
                                  (10 / 812) * height,
                                  (40 / 375) * width,
                                  (5 / 812) * height),
                              child: TextFormField(
                                onChanged: (value) {
                                  vm.email = value;
                                },
                                decoration: InputDecoration(
                                  labelText:
                                      vm.email != "" ? vm.email : "Email",
                                  labelStyle:
                                      TextStyle(fontSize: 0.035 * width),
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(13.0),
                                    borderSide: new BorderSide(),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: (12 / 375) * width,
                                      top: (6 / 812) * height,
                                      bottom: (6 / 812) * height),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            new Container(
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(13.0),
                                color: Color(0xffF4F4F4),
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                      color: Colors.grey[500],
                                      blurRadius: 4.0, // soften the shadow
                                      spreadRadius: 1.0, //extend the shadow
                                      offset: Offset(
                                        4.0,
                                        // Move to right 10  horizontally
                                        6.0, // Move to bottom 10 Vertically
                                      )),
                                ],
                              ),
                              margin: EdgeInsets.fromLTRB(
                                  (40 / 375) * width,
                                  (10 / 812) * height,
                                  (40 / 375) * width,
                                  (5 / 812) * height),
                              child: TextFormField(
                                onChanged: (value) {
                                  vm.username = value;
                                },
                                decoration: InputDecoration(
                                  labelText: vm.username != ""
                                      ? vm.username
                                      : "Username",
                                  labelStyle:
                                      TextStyle(fontSize: 0.035 * width),
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(13.0),
                                    borderSide: new BorderSide(),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: (12 / 375) * width,
                                      top: (6 / 812) * height,
                                      bottom: (6 / 812) * height),
                                ),
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            new Container(
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(13.0),
                                color: Color(0xffF4F4F4),
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                      color: Colors.grey[500],
                                      blurRadius: 4.0, // soften the shadow
                                      spreadRadius: 1.0, //extend the shadow
                                      offset: Offset(
                                        4.0,
                                        // Move to right 10  horizontally
                                        6.0, // Move to bottom 10 Vertically
                                      )),
                                ],
                              ),
                              margin: EdgeInsets.fromLTRB(
                                  (40 / 375) * width,
                                  (10 / 812) * height,
                                  (40 / 375) * width,
                                  (5 / 812) * height),
                              child: TextFormField(
                                onChanged: (value) {
                                  vm.systemID = int.parse(value);
                                },
                                decoration: InputDecoration(
                                  labelText: vm.systemID != 0
                                      ? vm.systemID.toString()
                                      : "System ID",
                                  labelStyle:
                                      TextStyle(fontSize: 0.035 * width),
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(13.0),
                                    borderSide: new BorderSide(),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: (12 / 375) * width,
                                      top: (6 / 812) * height,
                                      bottom: (6 / 812) * height),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            new Container(
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(13.0),
                                color: Color(0xffF4F4F4),
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                      color: Colors.grey[500],
                                      blurRadius: 4.0, // soften the shadow
                                      spreadRadius: 1.0, //extend the shadow
                                      offset: Offset(
                                        4.0,
                                        // Move to right 10  horizontally
                                        6.0, // Move to bottom 10 Vertically
                                      )),
                                ],
                              ),
                              margin: EdgeInsets.fromLTRB(
                                  (40 / 375) * width,
                                  (10 / 812) * height,
                                  (40 / 375) * width,
                                  (0 / 812) * height),
                              child: TextFormField(
                                onChanged: (value) => vm.password = value,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle:
                                      TextStyle(fontSize: 0.035 * width),
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(13.0),
                                    borderSide: new BorderSide(),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: setHidePassword,
                                    icon: hidePassword
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: (12 / 375) * width,
                                      top: (6 / 812) * height,
                                      bottom: (6 / 812) * height),
                                ),
                                obscureText: hidePassword,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  (40 / 375) * width,
                                  (10 / 812) * height,
                                  (40 / 375) * width,
                                  (0 / 812) * height),
                              child: ButtonWidget(
                                buttonText: "Sign Up",
                                onPress: () async {
                                  vm.signUp().then((value) => {
                                        Navigator.pushReplacementNamed(
                                            context, '/')
                                      });
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: (70 / 375) * width,
                                  top: (5 / 812) * height),
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  text: "Already have an account?     ",
                                  style: TextStyle(
                                      fontSize: 0.035 * width,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: "Login",
                                        style: TextStyle(
                                            fontSize: 0.035 * width,
                                            fontWeight: FontWeight.bold),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(
                                                context, '/login');
                                          }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
