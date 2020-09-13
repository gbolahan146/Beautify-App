
import 'package:beautify/ui/view/bottom_nav.dart';
import 'package:beautify/ui/view/create/create.dart';
import 'package:beautify/ui/view/homepage/home.dart';
import 'package:beautify/ui/view/onboarding/onboarding.dart';
import 'package:beautify/ui/view/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  ///Route names used through out the app will be specified as static constants here in this format
  static const String home = '/home';
  static const String splashScreen = '/splashscreen';
  static const String onboarding = '/onboarding';

    static const String bottomBar = '/bottomBar';
    static const String create = '/create';
 



  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.splashScreen: (context) => SplashScreen(),
    RouteNames.onboarding: (context) => Onboarding(),
     RouteNames.bottomBar: (context) => MyHomePage(),
     RouteNames.create: (context) => ChartScreen(),
    RouteNames.home: (context) => HomeScreen(),


  };
}
