import 'package:flutter/material.dart';

class Tugas1flutter extends StatelessWidget {
  const Tugas1flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar : bagian atas di tampilan aplikasi
      appBar: AppBar(
        backgroundColor:Color(0xff005F02),
        title: Text("Profil Saya",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ), 
      //appbar : bagian atas bawah setelah appbar di tampilan aplikasi
      body: Column(
        children: [
          Text("Nama: Regina Alya", 
          style: TextStyle(fontSize: 30,),
          ),
          Row(
            children: [
              Icon(Icons.location_on),
              Text("Central Jekardah")
            ],
          ),
          Text("Saya senang menganalisa bagaimana dunia bekerja dan pengaruhnya terhadap kehidupan.")
        ],
      ),
    );
  }
}