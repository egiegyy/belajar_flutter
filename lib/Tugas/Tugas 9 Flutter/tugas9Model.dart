import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%209%20Flutter/personalTrainer.dart';

class T9Model extends StatelessWidget {
  const T9Model({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Personal Trainer",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
        ),
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: trainers.length,
              itemBuilder: (BuildContext context, int index) {
                final trainer = trainers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(trainer.profile ?? ''),
                  ),
                  title: Text(trainer.name ?? '',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(trainer.ability ?? '',
                  style: TextStyle(color: Colors.white)
                  ),
                  trailing: Text(trainer.certification ?? '',
                  style: TextStyle(
                  color: Colors.white,
                  ),
                  )
                  );
                },
              ),
          ),
          ],
        ),
      ),
    );
  }
}