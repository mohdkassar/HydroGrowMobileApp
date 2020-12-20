import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  // ignore: non_constant_identifier_names
  const BaseAppBar({Key key, this.title}) : super(key: key);

  /// you can add more fields that meet your needs
  Widget backButton(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (!(title == "My Plants")) {
      return Center(
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.navigate_before,
            size: (20 / 414) * width,
          ),
          color: Colors.white,
        ),
      );
    } else
      return Container(
        padding: EdgeInsets.fromLTRB((8 / 414) * width, (8 / 812) * height,
            (8 / 414) * width, (8 / 812) * height),
      );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: (70 / 812) * height,
      child: PreferredSize(
        preferredSize: Size(double.infinity, (70 / 375) * width),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
          ]),
          width: width,
          height: (70 / 812) * height,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff557571),
            ),
            child: Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    backButton(context),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          (5 / 414) * width,
                          (0 / 812) * height,
                          (5 / 414) * width,
                          (0 / 812) * height),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: width * 0.05, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
