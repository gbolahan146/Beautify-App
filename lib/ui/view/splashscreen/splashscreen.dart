import 'dart:async';

import 'package:beautify/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
Animation rotationAnimation;

AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Defining controller with animation duration of two seconds
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    rotationAnimation = Tween(begin: 0.0, end: 3.14).animate(controller);
    controller.addListener(() {
      setState(() {});
    });

    // Repeat the animation after finish
    controller.repeat();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('token');

    return new Timer(duration, () {
      if (id != null) {
        Navigator.pushNamed(context, RouteNames.onboarding);
      } else {
        Navigator.pushNamed(context, RouteNames.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: rotationAnimation.value,
                          child: Container(
                padding: const EdgeInsets.all(30),
                child: Image.asset('assets/images/logo.png', scale: 3,),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
