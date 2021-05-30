import 'package:covidui/main.dart';
import 'package:covidui/pages/home/home.dart';
import 'package:covidui/pages/splash.dart';
import 'package:covidui/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) {
              return SplashScreen();
            },
            settings: settings);
      case Routes.home:
        return MaterialPageRoute(
            builder: (BuildContext context) {
              return MyHomePage();
            },
            settings: settings);
      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Error Route"),
            ),
          );
        });
    }
  }
}
