import 'package:HydroGrow/ViewModels/OrderViewModel.dart';
import 'package:HydroGrow/utils/Widgets/BaseAppBar.dart';
import 'package:HydroGrow/utils/Widgets/ButtonWidget.dart';
import 'package:HydroGrow/utils/Widgets/ToastWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  TextEditingController cityController;
  TextEditingController addressController;

  @override
  void initState() {
    cityController = new TextEditingController();
    addressController = new TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<OrderViewModel>(
            builder: (context, vm, child) => Column(
              children: [
                BaseAppBar(
                  title: "Order Solutions",
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      (8 / 414) * width,
                      (8 / 896) * height,
                      (8 / 414) * width,
                      (5 / 896) * height),
                  child: Text('Available Solutions',
                      style: TextStyle(
                          fontSize: width * 0.045,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      (8 / 414) * width,
                      (8 / 896) * height,
                      (8 / 414) * width,
                      (5 / 896) * height),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        title: Text("Stock Solution 1"),
                        value: vm.solution1,
                        onChanged: (value) {
                          vm.handleSolution1();
                        },
                      ),
                      CheckboxListTile(
                        title: Text("Stock Solution 2"),
                        value: vm.solution2,
                        onChanged: (value) {
                          vm.handleSolution2();
                        },
                      ),
                      CheckboxListTile(
                        title: Text("Acid Solution"),
                        value: vm.acidSolution,
                        onChanged: (value) {
                          vm.handleSolution3();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      (8 / 414) * width,
                      (8 / 896) * height,
                      (8 / 414) * width,
                      (5 / 896) * height),
                  child: Text('Address: ',
                      style: TextStyle(
                          fontSize: width * 0.045,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 35, 40, 5),
                  child: TextFormField(
                    onChanged: (value) => vm.city = value,
                    decoration: InputDecoration(
                      labelText: 'City',
                      labelStyle: TextStyle(fontSize: 0.035 * width),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 12.0, top: 6.0, bottom: 6.0, right: 0.0),
                    ),
                    keyboardType: TextInputType.name,
                    controller: cityController,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 35, 40, 5),
                  child: TextFormField(
                    onChanged: (value) => vm.address = value,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      labelStyle: TextStyle(fontSize: 0.035 * width),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 12.0, top: 6.0, bottom: 6.0, right: 0.0),
                    ),
                    keyboardType: TextInputType.name,
                    controller: addressController,
                  ),
                ),
                ButtonWidget(
                  buttonText: "Confirm Order",
                  onPress: () {
                    if (vm.city != "" && vm.address != "")
                      vm.createOrder().then((value) =>
                          Navigator.pushReplacementNamed(context, '/'));
                    else {
                      ToastWidget(
                        context: context,
                        toastMessage: "Please fill all required fields",
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
