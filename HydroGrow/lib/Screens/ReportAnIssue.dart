import 'package:HydroGrow/utils/Widgets/BaseAppBar.dart';
import 'package:HydroGrow/utils/Widgets/ButtonWidget.dart';
import 'package:HydroGrow/utils/Widgets/LogoWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportAnIssueScreen extends StatefulWidget {
  @override
  _ReportAnIssueScreenState createState() => _ReportAnIssueScreenState();
}

class _ReportAnIssueScreenState extends State<ReportAnIssueScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BaseAppBar(
                title: "Report An Issue",
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Logo(),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          (51 / 411) * width,
                          (28 / 823) * height,
                          (51 / 411) * width,
                          (8 / 896) * height), // hack textfield height
                      padding: EdgeInsets.only(bottom: (40.0 / 812) * height),
                      child: TextField(
                        onChanged: (value) {},
                        style: TextStyle(fontSize: width * 0.04),
                        maxLines: 7,
                        decoration: InputDecoration(
                          hintText: "Please enter your message here!",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    ButtonWidget(
                      buttonText: "Submit",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
