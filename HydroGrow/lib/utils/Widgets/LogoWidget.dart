import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Size_Config.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(
          (50 / 375) * width, (50 / 812) * height, (50 / 375) * width, 0),
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            'Assets/Images/HydroGrowLogo.svg',
            width: 20 * SizeConfig.imageSizeMultiplier,
            height: 35 * SizeConfig.imageSizeMultiplier,
          ),
        ], //children
      ),
    );
  }
}
