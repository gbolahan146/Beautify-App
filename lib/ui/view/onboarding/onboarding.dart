import 'package:beautify/core/responsiveness.dart';
import 'package:beautify/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation sizeAnimation;

  @override
  void initState() {
    super.initState();

    // Defining controller with animation duration of two seconds
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    // Defining both color and size animations
    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(controller);

    // Rebuilding the screen when animation goes ahead
    controller.addListener(() {
      setState(() {});
    });

    // Repeat the animation after finish
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/bg.png',
                        ),
                        fit: BoxFit.cover)
                        ),
                child: Padding(
                  padding: EdgeInsets.only(left: 37, right: 37),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.bottomBar);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: sizeAnimation.value,
                            width: sizeAnimation.value,
                            padding: const EdgeInsets.all(30),
                            child: Image.asset(
                              'assets/images/logo.png',
                              scale: 3,
                            ),
                          ),
                          Text('Click to get started',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ))
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
