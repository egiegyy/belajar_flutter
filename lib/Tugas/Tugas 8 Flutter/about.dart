import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "About",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
          ),
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(20),
      child: Column(
        children: [
          Image.asset("assets/images/logoFitGuide.png"),
          Text("FitGuide is a fitness app that helps users plan and follow structured gym workouts, providing guided exercises and personalized routines to achieve better fitness results.",
          maxLines: 10,
          style: TextStyle(
            color: Colors.white
          ),
          )
        ],
      ),
      ),
    );
  }
}