//A custom class for handling text size, margin szie and other responsiveness related issues
import 'package:flutter/material.dart';

class Config {
  //New config Modification
  // static keyword included so you can call this method without instantiating an object of it like so :
  // Config.yMargin(context, 2)
  static double yMargin(BuildContext context, double height) {
    final viewportHeight = MediaQuery.of(context).size.height / 100;

    height = height / viewportHeight;
    return height * viewportHeight;
  }

  // static keyword included so you can call this method without instantiating an object of it like so :
  // Config.xMargin(context, 2)
  static double xMargin(BuildContext context, double width) {
    final viewportWidth = MediaQuery.of(context).size.width / 100;

    width = width / viewportWidth;
    return width * viewportWidth;
  }

  // static keyword included so you can call this method without instantiating an object of it like so :
  // Config.textSize(context, 2)
  static double textSize(BuildContext context, double textSize) {
    final viewportWidth = MediaQuery.of(context).size.width / 100;

    textSize = textSize / viewportWidth;
    return textSize * viewportWidth;
  }
}
