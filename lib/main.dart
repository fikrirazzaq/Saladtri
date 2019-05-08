import 'package:flutter/material.dart';
import 'package:saladtri/src/ui/dashboard_screen.dart';
import 'package:saladtri/src/ui/landing_screen.dart';
import 'package:saladtri/src/ui/recipe_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Saladtri",
      home: LandingScreen(),
      theme: ThemeData(fontFamily: 'OpenSans', primaryColor: Color(0xffc00d23), canvasColor: Colors.transparent),
    );
  }
}