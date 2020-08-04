import 'package:corona_app/screens/bottom_nav_screen.dart';
import 'package:corona_app/screens/main_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Covid-19',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: BottomNavScreen(),
    );
  }
}
