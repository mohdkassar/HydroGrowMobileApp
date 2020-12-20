import 'package:HydroGrow/ViewModels/SystemSetUpViewModel.dart';
import 'package:HydroGrow/utils/Widgets/BaseAppBar.dart';
import 'package:HydroGrow/utils/Widgets/ButtonWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SystemSetUpScreen extends StatefulWidget {
  @override
  _SystemSetUpScreenState createState() => _SystemSetUpScreenState();
}

class _SystemSetUpScreenState extends State<SystemSetUpScreen> {
  @override
  void initState() {
    //_key = new Key('1');
    //_key2 = new Key('2');
    final vm = Provider.of<SystemSetUpViewModel>(context, listen: false);
    vm.fetchPlantProfiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: BaseAppBar(
                  title: "System Setup",
                ),
              ),
              Consumer<SystemSetUpViewModel>(
                builder: (context, vm, child) => Container(
                  margin: EdgeInsets.fromLTRB(
                      (8 / 414) * width,
                      (8 / 896) * height,
                      (8 / 414) * width,
                      (8 / 896) * height),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                (8 / 414) * width,
                                (8 / 896) * height,
                                (8 / 414) * width,
                                (5 / 896) * height),
                            child: Card(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(
                                    (25 / 414) * width,
                                    (25 / 896) * height,
                                    (25 / 414) * width,
                                    (25 / 896) * height),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          (8 / 414) * width,
                                          (8 / 896) * height,
                                          (8 / 414) * width,
                                          (5 / 896) * height),
                                      child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              (8 / 414) * width,
                                              (0 / 896) * height,
                                              (0 / 414) * width,
                                              (0 / 896) * height),
                                          child: Text(
                                            "Tray 1",
                                            style: TextStyle(
                                                fontSize: width * 0.05),
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          (8 / 414) * width,
                                          (8 / 896) * height,
                                          (8 / 414) * width,
                                          (5 / 896) * height),
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            (8 / 414) * width,
                                            (8 / 896) * height,
                                            (8 / 414) * width,
                                            (8 / 896) * height),
                                        child: DropdownButton(
                                          isExpanded: true,
                                          hint: Text(
                                            vm.tray1ID != ""
                                                ? vm.tray1ID
                                                : 'Plants',
                                            style: TextStyle(
                                                fontSize: width * 0.03),
                                          ),
                                          items: vm.plantProfilesDropDown,
                                          onChanged: (value) {
                                            setState(() {
                                              vm.tray1ID = value;
                                              //hintPickupDistrict = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(
                                            (8 / 414) * width,
                                            (0 / 896) * height,
                                            (0 / 414) * width,
                                            (0 / 896) * height),
                                        child: Text(
                                          "Tray 2",
                                          style:
                                              TextStyle(fontSize: width * 0.05),
                                        )),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          (8 / 414) * width,
                                          (8 / 896) * height,
                                          (8 / 414) * width,
                                          (8 / 896) * height),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        hint: Text(
                                          vm.tray2ID != ""
                                              ? vm.tray2ID
                                              : 'Plants',
                                          style:
                                              TextStyle(fontSize: width * 0.03),
                                        ),
                                        items: vm.plantProfilesDropDown,
                                        onChanged: (value) {
                                          setState(() {
                                            vm.tray2ID = value;
                                            //hintPickupDistrict = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                (8 / 414) * width,
                                (8 / 896) * height,
                                (8 / 414) * width,
                                (5 / 896) * height),
                            child: ButtonWidget(
                              buttonText: 'Submit',
                              onPress: () {
                                print('object');
                                vm.systemSetUp().then((value) =>
                                    {Navigator.popAndPushNamed(context, '/')});
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
