import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  static const Color buttonColor = Color(0xff557571);
  const ButtonWidget(
      {Key key, this.buttonText, this.onPress, Null Function() onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: (52 / 812) * height,
      width: (280 / 375) * width,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: buttonColor,
        onPressed: () {
          onPress();
        },
        child: Text(
          buttonText,
          // ignore: deprecated_member_use
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              color: Colors.white),
          // TextStyle(
          //   color: Colors.white,
          //   fontSize: 23,
          // ),
        ),
      ),
    );
  }
}
