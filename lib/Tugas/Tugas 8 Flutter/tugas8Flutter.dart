import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%208%20Flutter/about.dart';
import 'package:flutter_application_1/Tugas/Tugas%207%20Flutter/drawer.dart';

class Tugas8flutter extends StatefulWidget {
  const Tugas8flutter({super.key});

  @override
  State<Tugas8flutter> createState() => _Tugas8flutterState();
}

class _Tugas8flutterState extends State<Tugas8flutter> {
  int _currentIndex = 0;
  void ontapItem(int index) {
    _currentIndex = index;
    setState(() {});
  }

  final List<Widget> listWidget = [TugasDrawer(), AboutPage() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Search",
            backgroundColor: Colors.blue,
          ),
        ],
        selectedItemColor: Colors.green,
        selectedIconTheme: IconThemeData(
          color: Colors.green,
        ),
        currentIndex: _currentIndex,
        onTap: ontapItem,
      ),
    );
  }
}