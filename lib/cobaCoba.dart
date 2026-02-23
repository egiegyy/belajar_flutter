import 'package:flutter/material.dart';

class CobaAja extends StatelessWidget {
  const CobaAja({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: Icon(Icons.menu,
        color: Colors.white,
        ),
        title: Text
        (
          "PPKD JP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25
          ),
        ),
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(20),
      child: 
      Column(
        children: [
          SingleChildScrollView
          (scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Image.asset("assets/images/posterCompetition2.png",
                  fit: BoxFit.fill),
                ),
                SizedBox(width: 10),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
      ),
    );
  }
}