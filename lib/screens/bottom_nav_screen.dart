import 'package:corona_app/screens/home_screen.dart';
import 'package:corona_app/screens/main_screen.dart';
import 'package:corona_app/screens/screens.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens=[
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index)=> setState(()=>_currentIndex=index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home,Icons.insert_chart].asMap().map((key, value) => MapEntry(
            key,
            BottomNavigationBarItem(
          title: Text(''),
          icon: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0),
            decoration: BoxDecoration(color: _currentIndex== key ? Color(0xFF20B2AA)
            : Colors.transparent,
            borderRadius: BorderRadius.circular(15.0)),
            child: Icon(value),
          ),
        )))
        .values
          .toList()
      ),
    );
  }
}
