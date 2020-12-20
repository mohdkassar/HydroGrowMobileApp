import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './utils/router.dart' as router;
import 'package:flutter/services.dart';

import 'Size_Config.dart';
import 'ViewModels/UserViewModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // uncomment this once we take off the device preview widget to force the portrait mode only.
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserViewModel>(
          create: (context) => UserViewModel(),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                onGenerateRoute: router.generateRoute,
                initialRoute: '/',
              );
            },
          );
        },
      ),
    );
  }
}
