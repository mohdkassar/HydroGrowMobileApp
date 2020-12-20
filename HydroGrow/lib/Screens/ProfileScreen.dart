import 'package:HydroGrow/ViewModels/UserViewModel.dart';
import 'package:HydroGrow/utils/Widgets/BaseAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<UserViewModel>(
            builder: (context, vmUser, child) => Container(
              child: Column(
                children: [
                  BaseAppBar(
                    title: "Profile",
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: (16 / 375) * width,
                        top: (30 / 667) * height,
                        bottom: (2 / 667) * height),
                    child: Row(
                      children: <Widget>[
                        Text(vmUser.name,
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: (30 / 667) * height),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: (16 / 375) * width),
                          child: Text(vmUser.email,
                              style: TextStyle(fontSize: width * 0.04)),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2.2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/systemProfile');
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: (16 / 375) * width,
                          top: (10 / 667) * height,
                          bottom: (10 / 667) * height),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("System Profile",
                              style: TextStyle(fontSize: width * 0.04)),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/systemProfile');
                            },
                            icon: Icon(Icons.keyboard_arrow_right),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.2,
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.pushNamed(context, '/aboutUs');
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: (16 / 375) * width,
                          top: (10 / 667) * height,
                          bottom: (10 / 667) * height),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("About us",
                              style: TextStyle(fontSize: width * 0.04)),
                          IconButton(
                            onPressed: () async {
                              Navigator.pushNamed(context, '/aboutUs');
                            },
                            icon: Icon(Icons.keyboard_arrow_right),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/reportAnIssue');
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: (16 / 375) * width,
                          top: (10 / 667) * height,
                          bottom: (10 / 667) * height),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Report an Issue",
                              style: TextStyle(fontSize: width * 0.04)),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/reportAnIssue');
                            },
                            icon: Icon(Icons.keyboard_arrow_right),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.2,
                  ),
                  GestureDetector(
                    onTap: () async {
                      vmUser.resetStoredUser();
                      await SharedPreferences.getInstance().then((value) async {
                        await value.setInt('UserID', 0);
                        Navigator.pushReplacementNamed(context, '/login');
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: (16 / 375) * width,
                          top: (10 / 667) * height,
                          bottom: (10 / 667) * height),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Logout",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff557571))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 1) {
              Navigator.popAndPushNamed(context, '/systemProfile');
            }
            if (value == 0) {
              Navigator.popAndPushNamed(context, '/');
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("My Plants")),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text("System Profile")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Profile")),
          ],
          currentIndex: 2,
          elevation: 10,
        ),
      ),
    );
  }
}
