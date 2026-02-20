import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading:
        Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
          size: 30),
        centerTitle: true,
        title: Text("Home", 
        style: 
        TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.white
          ),
        ),
        actions: [
          Icon(
            Icons.search_rounded,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
      
    );
  }
}