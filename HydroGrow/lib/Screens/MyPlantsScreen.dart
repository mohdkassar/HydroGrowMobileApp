import 'package:HydroGrow/ViewModels/MyPlantsViewModel.dart';
import 'package:HydroGrow/ViewModels/UserViewModel.dart';
import 'package:HydroGrow/utils/Widgets/BaseAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPlantsScreen extends StatefulWidget {
  @override
  _MyPlantsScreenState createState() => _MyPlantsScreenState();
}

class _MyPlantsScreenState extends State<MyPlantsScreen> {
  @override
  void initState() {
    //_key = new Key('1');
    //_key2 = new Key('2');
    final vm = Provider.of<MyPlantsViewModel>(context, listen: false);
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
            child: Consumer<MyPlantsViewModel>(
          builder: (context, vm, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BaseAppBar(
                title: "My Plants",
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          (8 / 414) * width,
                          (8 / 896) * height,
                          (8 / 414) * width,
                          (5 / 896) * height),
                      child: Text("Tray 1",
                          style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          (8 / 414) * width,
                          (8 / 896) * height,
                          (8 / 414) * width,
                          (5 / 896) * height),
                      child: Text(vm.plantName1,
                          style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(vm.imageTray1),
                          //whatever image you can put here
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  (8 / 414) * width,
                                  (8 / 896) * height,
                                  (8 / 414) * width,
                                  (5 / 896) * height),
                              child: Text("pH: " + vm.pH1,
                                  style: TextStyle(fontSize: width * 0.03)),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  (8 / 414) * width,
                                  (8 / 896) * height,
                                  (8 / 414) * width,
                                  (5 / 896) * height),
                              child: Text("EC: " + vm.ec1,
                                  style: TextStyle(fontSize: width * 0.03)),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  (8 / 414) * width,
                                  (8 / 896) * height,
                                  (8 / 414) * width,
                                  (5 / 896) * height),
                              child: Text("Water Level: " + vm.waterLevel1,
                                  style: TextStyle(fontSize: width * 0.03)),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  (8 / 414) * width,
                                  (8 / 896) * height,
                                  (8 / 414) * width,
                                  (5 / 896) * height),
                              child: Text("Temperature: " + vm.temperature1,
                                  style: TextStyle(fontSize: width * 0.03)),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: RichText(
                                text: TextSpan(
                                  text: 'Germination',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                textAlign: TextAlign.center,
                              )),
                              //Text('Ordered'),
                              Expanded(
                                  flex: 1,
                                  child: IntrinsicHeight(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            'Growth',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: CustomPaint(
                                              painter: MyProgressLine(10),
                                              child: Container(
                                                width: double.infinity,
                                                height: 5.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  child: RichText(
                                text: TextSpan(
                                  text: 'Harvest',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                textAlign: TextAlign.center,
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Padding(
                    //       padding: EdgeInsets.fromLTRB(
                    //           (8 / 414) * width,
                    //           (8 / 896) * height,
                    //           (8 / 414) * width,
                    //           (5 / 896) * height),
                    //       child: RaisedButton(
                    //         onPressed: () {},
                    //         child: Text(
                    //           "Generate Report",
                    //           style: TextStyle(color: Colors.white),
                    //         ),
                    //         color: Color(0xff557571),
                    //       ),
                    //     )
                    //   ],
                    // )
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          (8 / 414) * width,
                          (8 / 896) * height,
                          (8 / 414) * width,
                          (5 / 896) * height),
                      child: Text("Tray 2",
                          style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          (8 / 414) * width,
                          (8 / 896) * height,
                          (8 / 414) * width,
                          (5 / 896) * height),
                      child: Text(vm.plantName2,
                          style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(vm.imageTray2),
                          //whatever image you can put here
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  (8 / 414) * width,
                                  (8 / 896) * height,
                                  (8 / 414) * width,
                                  (5 / 896) * height),
                              child: Text("pH: " + vm.pH2,
                                  style: TextStyle(fontSize: width * 0.03)),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  (8 / 414) * width,
                                  (8 / 896) * height,
                                  (8 / 414) * width,
                                  (5 / 896) * height),
                              child: Text("EC: " + vm.ec2,
                                  style: TextStyle(fontSize: width * 0.03)),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  (8 / 414) * width,
                                  (8 / 896) * height,
                                  (8 / 414) * width,
                                  (5 / 896) * height),
                              child: Text("Water Level: " + vm.waterLevel2,
                                  style: TextStyle(fontSize: width * 0.03)),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  (8 / 414) * width,
                                  (8 / 896) * height,
                                  (8 / 414) * width,
                                  (5 / 896) * height),
                              child: Text("Temperature: " + vm.temperature2,
                                  style: TextStyle(fontSize: width * 0.03)),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: RichText(
                                text: TextSpan(
                                  text: 'Germination',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                textAlign: TextAlign.center,
                              )),
                              //Text('Ordered'),
                              Expanded(
                                  flex: 1,
                                  child: IntrinsicHeight(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            'Growth',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: CustomPaint(
                                              painter: MyProgressLine(1),
                                              child: Container(
                                                width: double.infinity,
                                                height: 5.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  child: RichText(
                                text: TextSpan(
                                  text: 'Harvest',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                textAlign: TextAlign.center,
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Padding(
                    //       padding: EdgeInsets.fromLTRB(
                    //           (8 / 414) * width,
                    //           (8 / 896) * height,
                    //           (8 / 414) * width,
                    //           (5 / 896) * height),
                    //       child: RaisedButton(
                    //         onPressed: () {},
                    //         child: Text(
                    //           "Generate Report",
                    //           style: TextStyle(color: Colors.white),
                    //         ),
                    //         color: Color(0xff557571),
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                ),
              )
            ],
          ),
        )),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 1) {
              Navigator.popAndPushNamed(context, '/systemProfile');
            }
            if (value == 2) {
              Navigator.popAndPushNamed(context, '/profile');
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("My Plants")),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text("System Settings")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Profile")),
          ],
          currentIndex: 0,
          elevation: 10,
        ),
      ),
    );
  }
}

class MyProgressLine extends CustomPainter {
  final int growth;
  MyProgressLine(this.growth);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    double endPointsRadius = 5.0;

    // Draws starting point
    canvas.drawCircle(Offset.zero, endPointsRadius, paint);
    canvas.drawLine(Offset(endPointsRadius, 0.0),
        Offset(endPointsRadius + growth, 0.0), paint);

    // Draws current progress line
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(endPointsRadius + growth, 0.0), 3.0, paint);

    // Draws endpoint
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.grey.withOpacity(0.5);
    canvas.drawLine(
        Offset(endPointsRadius + growth, 0.0), Offset(100, 0.0), paint);
    canvas.drawCircle(
        Offset(100 + endPointsRadius, 0.0), endPointsRadius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
