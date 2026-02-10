import 'package:flutter/material.dart';

class ScaffoldDay5 extends StatelessWidget {
  const ScaffoldDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff005F02),
        title: Text("PPKD JP"),
        centerTitle: true,
      ), 
      //body: Text("HALO SEMUANYA!"),
      body: Column(
        children: [
          Text("Nama saya siapa ya",
          style: TextStyle(fontSize: 20),),
          Text("Nama saya siapa ya"),
          Text("Nama saya siapa ya"),
          Text("Nama saya siapa ya"),
          Text("Nama saya siapa ya"),
          Text("Nama saya siapa ya"),

          Row(
          
          )
        ],
      ),
      backgroundColor: Color(0xffC0B87A),
    );
  }
}