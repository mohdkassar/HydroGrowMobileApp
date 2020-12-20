import 'package:HydroGrow/ViewModels/SystemProfileViewModel.dart';
import 'package:HydroGrow/ViewModels/UserViewModel.dart';
import 'package:HydroGrow/utils/Widgets/BaseAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SystemProfileScreen extends StatefulWidget {
  @override
  _SystemProfileScreenState createState() => _SystemProfileScreenState();
}

class _SystemProfileScreenState extends State<SystemProfileScreen> {
  @override
  void initState() {
    //_key = new Key('1');
    //_key2 = new Key('2');
    final vm = Provider.of<SystemProfileViewModel>(context, listen: false);
    vm.getSystemData();
    final vmUser = Provider.of<UserViewModel>(context, listen: false);
    vmUser.fetchingUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<SystemProfileViewModel>(
            builder: (context, vm, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: BaseAppBar(
                    title: "System Profile",
                  ),
                ),
                Container(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    (8 / 414) * width,
                                    (8 / 896) * height,
                                    (8 / 414) * width,
                                    (5 / 896) * height),
                                child: Text('System Status',
                                    style: TextStyle(
                                        fontSize: width * 0.045,
                                        fontStyle: FontStyle.italic)),
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 1000),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: vm.systemStatus
                                      ? Colors.green
                                      : Colors.red),
                              child: Stack(
                                children: [
                                  AnimatedPositioned(
                                    child: AnimatedSwitcher(
                                      duration: Duration(milliseconds: 1000),
                                      transitionBuilder: (Widget child,
                                          Animation<double> animation) {
                                        return RotationTransition(
                                          turns: animation,
                                          child: child,
                                        );
                                      },
                                      child: vm.systemStatus
                                          ? Icon(
                                              Icons.check_circle,
                                              color: Colors.greenAccent
                                                  .withOpacity(0.5),
                                              size: 35,
                                              key: UniqueKey(),
                                            )
                                          : Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.redAccent[300],
                                              size: 35,
                                              key: UniqueKey(),
                                            ),
                                    ),
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.easeIn,
                                    top: 3,
                                    left: vm.systemStatus ? 60 : 0,
                                    right: vm.systemStatus ? 0 : 60,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(
                                (8 / 414) * width,
                                (8 / 896) * height,
                                (8 / 414) * width,
                                (5 / 896) * height),
                            child: Text(
                                vm.systemStatus ? " " : 'Fault Detected!',
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    color: Colors.red,
                                    fontStyle: FontStyle.italic))),
                      ]),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            (8 / 414) * width,
                            (8 / 896) * height,
                            (8 / 414) * width,
                            (5 / 896) * height),
                        child: Text('Stock Solutions',
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.bold)),
                      ),
                      Card(
                        color: Color(0xffFAFAFA),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.fromLTRB(
                            (20 / 414) * width,
                            (20 / 896) * height,
                            (20 / 414) * width,
                            (20 / 896) * height),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  (8 / 414) * width,
                                  (8 / 896) * height,
                                  (8 / 414) * width,
                                  (5 / 896) * height),
                              child: Text('Stock Solution 1',
                                  style: TextStyle(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (8 / 414) * width,
                                      (8 / 896) * height,
                                      (8 / 414) * width,
                                      (5 / 896) * height),
                                  child: CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    percent: vm.stockSolution1,
                                    center: new Text(
                                        (vm.stockSolution1 * 100).toString() +
                                            "%"),
                                    progressColor: vm.stockSolution1 > 0.5
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (8 / 414) * width,
                                      (8 / 896) * height,
                                      (8 / 414) * width,
                                      (5 / 896) * height),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/order');
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.shopping_cart),
                                        Text('Order Now')
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Card(
                        color: Color(0xffFAFAFA),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.fromLTRB(
                            (20 / 414) * width,
                            (20 / 896) * height,
                            (20 / 414) * width,
                            (20 / 896) * height),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  (8 / 414) * width,
                                  (8 / 896) * height,
                                  (8 / 414) * width,
                                  (5 / 896) * height),
                              child: Text('Stock Solution 2',
                                  style: TextStyle(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (8 / 414) * width,
                                      (8 / 896) * height,
                                      (8 / 414) * width,
                                      (5 / 896) * height),
                                  child: CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    percent: vm.stockSolution2,
                                    center: new Text(
                                        (vm.stockSolution2 * 100).toString() +
                                            "%"),
                                    progressColor: vm.stockSolution2 > 0.5
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (8 / 414) * width,
                                      (8 / 896) * height,
                                      (8 / 414) * width,
                                      (5 / 896) * height),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.popAndPushNamed(
                                          context, '/order');
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.shopping_cart),
                                        Text('Order Now')
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Card(
                        color: Color(0xffFAFAFA),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.fromLTRB(
                            (20 / 414) * width,
                            (20 / 896) * height,
                            (20 / 414) * width,
                            (20 / 896) * height),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  (8 / 414) * width,
                                  (8 / 896) * height,
                                  (8 / 414) * width,
                                  (5 / 896) * height),
                              child: Text('Acidic Solution',
                                  style: TextStyle(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (8 / 414) * width,
                                      (8 / 896) * height,
                                      (8 / 414) * width,
                                      (5 / 896) * height),
                                  child: CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    percent: vm.acidSolution,
                                    center: new Text(
                                        (vm.acidSolution * 100).toString() +
                                            "%"),
                                    progressColor: vm.acidSolution > 0.5
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (8 / 414) * width,
                                      (8 / 896) * height,
                                      (8 / 414) * width,
                                      (5 / 896) * height),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/order');
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.shopping_cart),
                                        Text('Order Now')
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 0) {
              Navigator.popAndPushNamed(context, '/');
            }
            if (value == 2) {
              Navigator.popAndPushNamed(context, '/profile');
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
          currentIndex: 1,
          elevation: 10,
        ),
      ),
    );
  }
}
