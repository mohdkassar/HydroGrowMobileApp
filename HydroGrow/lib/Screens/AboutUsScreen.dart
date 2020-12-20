import 'package:HydroGrow/utils/Widgets/BaseAppBar.dart';
import 'package:HydroGrow/utils/Widgets/LogoWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BaseAppBar(
                title: "About Us",
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Logo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Text(
                            'HydroGro is a fully automated hydroponic system. It is developed in  a way where anyone can autonomously grow plants hydroponically.',
                            style: TextStyle(
                                fontSize: width * 0.045,
                                fontStyle: FontStyle.italic)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Contact us at: ',
                                  style: TextStyle(
                                      fontSize: width * 0.045,
                                      fontStyle: FontStyle.italic)),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('hello@hydrogro.com',
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('+96171199571',
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
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
    );
  }
}
