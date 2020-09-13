


import 'package:flutter/material.dart';
import 'core/routes/route_generator.dart';
import 'core/routes/route_names.dart';


void main() {
 
  runApp( Beautify()
      //This is only for debugging purposes
      //this package will be removed before shipping to production
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => Todly(),
      // ),
      );
}

class Beautify extends StatelessWidget {
  @override
  //The root of the application
  Widget build(BuildContext context) {
    
    return  MaterialAPP();
    
  }
}

class MaterialAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beautify App V1',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      routes: RouteNames.routes,
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      
     
    );
  }
}
