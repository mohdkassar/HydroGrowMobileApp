import 'package:HydroGrow/Screens/AboutUsScreen.dart';
import 'package:HydroGrow/Screens/LoginScreen.dart';
import 'package:HydroGrow/Screens/MyPlantsScreen.dart';
import 'package:HydroGrow/Screens/OrderScreen.dart';
import 'package:HydroGrow/Screens/ProfileScreen.dart';
import 'package:HydroGrow/Screens/ReportAnIssue.dart';
import 'package:HydroGrow/Screens/SignUpScreen.dart';
import 'package:HydroGrow/Screens/SystemProfileScreen.dart';
import 'package:HydroGrow/Screens/SystemSetupScreen.dart';
import 'package:HydroGrow/ViewModels/LoginViewModel.dart';
import 'package:HydroGrow/ViewModels/MyPlantsViewModel.dart';
import 'package:HydroGrow/ViewModels/OrderViewModel.dart';
import 'package:HydroGrow/ViewModels/SignUpViewModel.dart';
import 'package:HydroGrow/ViewModels/SystemProfileViewModel.dart';
import 'package:HydroGrow/ViewModels/SystemSetUpViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case '/splash':
    //   return MaterialPageRoute(builder: (context) => ShabebSplashScreen());
    case '/':
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<MyPlantsViewModel>(
                create: (context) => MyPlantsViewModel(),
                child: MyPlantsScreen(),
              ));
    case '/login':
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<LoginModelView>(
                create: (context) => LoginModelView(),
                child: LoginScreen(),
              ));

    case '/signUp':
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<SignUpViewModel>(
                create: (context) => SignUpViewModel(),
                child: SignUpScreen(),
              ));
    case '/systemProfile':
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<SystemProfileViewModel>(
                create: (context) => SystemProfileViewModel(),
                child: SystemProfileScreen(),
              ));
    case '/profile':
      return MaterialPageRoute(builder: (context) => ProfileScreen());

    case '/systemSetUp':
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<SystemSetUpViewModel>(
                create: (context) => SystemSetUpViewModel(),
                child: SystemSetUpScreen(),
              ));
    case '/order':
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<OrderViewModel>(
                create: (context) => OrderViewModel(),
                child: OrderScreen(),
              ));

    case '/aboutUs':
      return MaterialPageRoute(builder: (context) => AboutUsScreen());

    case '/reportAnIssue':
      return MaterialPageRoute(builder: (context) => ReportAnIssueScreen());
    default:
      return MaterialPageRoute(builder: (context) => MyPlantsScreen());
  }
}
