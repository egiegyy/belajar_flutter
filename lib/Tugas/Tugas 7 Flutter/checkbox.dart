import 'package:flutter/material.dart';

class TugasCheckbox extends StatefulWidget {
  const TugasCheckbox({super.key});

  @override
  State<TugasCheckbox> createState() => _TugasCheckboxState();
}

class _TugasCheckboxState extends State<TugasCheckbox> {
  bool _ischeck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Checkbox",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
          ),
      ),
      body: Padding(padding:EdgeInsetsGeometry.all(20),
      child: Column(
        children: [
          Text(
            "Syarat dan Ketentuan",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 29,
            ),
          ),
          Column(
            children: [
              Text(
                "Saya menyetujui semua persaratan yang berlaku"),
              Row(
                children: [
                  Checkbox(
                    value: _ischeck,
                    onChanged: (value) {
                        _ischeck = value ?? false;
                        setState(() {});
                     }
                    ),
                    Text("${_ischeck ? "Lanjutkan pendaftaran diperbolehkan" : "Anda belum bisa melanjutkan"}"),
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