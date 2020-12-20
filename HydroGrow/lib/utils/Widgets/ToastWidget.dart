import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {
  final String toastMessage;
  final BuildContext context;
  ToastWidget({this.context, this.toastMessage});

  flutterToast() {
    FlutterToast(context).showToast(
      toastDuration: Duration(seconds: 2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              toastMessage,
              style: Theme.of(context).textTheme.button,
            )),
      ),
    );
  }
}
