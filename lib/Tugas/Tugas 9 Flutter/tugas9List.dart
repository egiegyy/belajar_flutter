import 'package:flutter/material.dart';

class T9ListExercise extends StatelessWidget {
  T9ListExercise({super.key});
  final List<String> kategoriLatihan = [
    "Deadlift",
    "Push Up",
    "Pull Up",
    "Body Weight Squat",
    "Dumbell Thuster",
    "Kettlebell Swing",
    "Burpees",
    "Dumbbell Clean and Press",
    "Mountain Climbers",
    "Barbell Squat to Press",
    "Renegade Row",
    "Jump Squat",
    "Medicine Ball Slam"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Exercise",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
        ),
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(20),
      child: 
      ListView.builder(
        itemCount: kategoriLatihan.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: 
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(80),
                borderRadius: BorderRadius.circular(10)
              ),
              child: ListTile(
                title: Text(
                  "${kategoriLatihan[index]}",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
                subtitle: Text(
                  "Full Body",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                  ),
                ),
              ),
            ),
          );
        },
      ),
      ),
    );
  }
}