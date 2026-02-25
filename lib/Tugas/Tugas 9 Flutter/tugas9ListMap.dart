import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%209%20Flutter/personalTrainer.dart';

  class T9ListMap extends StatelessWidget {
  T9ListMap({super.key});

  final List<Map<String, dynamic>> programWorkout = [
  {
    "name": "Bench Press",
    "level": "Beginner",
    "type": "Push",
    "image" : "assets/images/ContohPushPullLeg.png"
  },
  {
    "name": "Lat Pulldown",
    "level": "Beginner",
    "type": "Pull",
    "image" : "assets/images/ContohPushPullLeg.png"
  },
  {
    "name": "Seated Cable Row",
    "level": "Beginner",
    "type": "Pull",
    "image" : "assets/images/ContohPushPullLeg.png"
  },
  {
    "name": "Pull Up",
    "level": "Intermediate",
    "type": "Pull",
    "image" : "assets/images/ContohPushPullLeg.png"
  },
  {
    "name": "Leg Press",
    "level": "Beginner",
    "type": "Leg",
    "image" : "assets/images/ContohPushPullLeg.png"
  },
  {
    "name": "Romanian Deadlift",
    "level": "Intermediate",
    "type": "Leg",
    "image" : "assets/images/ContohPushPullLeg.png"
  },
  {
    "name": "Push Up",
    "level": "Beginner",
    "type": "Full Body",
    "image" : "assets/images/ContohFullBody.png"
  },
  {
    "name": "Plank",
    "level": "Beginner",
    "type": "Full Body",
    "image" : "assets/images/ContohFullBody.png"
  },
  {
  "name": "Barbell Row",
  "level": "Beginner",
  "type": "Upper",
    "image" : "assets/images/ContohFullBody.png"
  },
  {
    "name": "Leg Extension",
    "level": "Beginner",
    "type": "Lower",
    "image" : "assets/images/ContohFullBody.png"
  },
  {
    "name": "Hamstring Curl",
    "level": "Beginner",
    "type": "Lower",
    "image" : "assets/images/ContohFullBody.png"
  },
{
  "name": "Calf Raise",
  "level": "Beginner",
  "type": "Lower",
    "image" : "assets/images/ContohFullBody.png"
}
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
      body: Padding(padding: EdgeInsets.all(20),
        child: 
        ListView.builder(
          itemCount: programWorkout.length,
          itemBuilder: (BuildContext context, int index) {
            final data = programWorkout[index];
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(80),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: ListTile(
                  leading: Image.asset(data["image"]),
                  title: Text(data["name"],
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                  ),
                  subtitle: Text(data["type"],
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
      )
    );
  }
}