import 'package:flutter/material.dart';

class TugasSwitch extends StatefulWidget {
  const TugasSwitch({super.key});

  @override
  State<TugasSwitch> createState() => _TugasSwitchState();
}

class _TugasSwitchState extends State<TugasSwitch> {
  @override
  bool onOff = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onOff ? Colors.blueAccent : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Switch",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
          ),
      ),
      body:
      Padding(padding:EdgeInsetsGeometry.all(20),
      child: Column(
        children: [
          Text(
            "Mode Gelap",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 29,
            ),
          ),
          Column(
            children: [
              Text(
                "Aktifkan Mode Gelap"),
              Row(
                children: [
                  Switch(
                    value: onOff,
                    onChanged: (value) {
                        onOff = value ?? false;
                        setState(() {});
                     }
                    ),
                  Text("${onOff ? "Mode Gelap" : "Mode Terang Aktif"}"),
                ],
              )
            ],
          )
        ],
      ),
       ),
    );
  }
}