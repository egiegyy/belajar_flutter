import 'package:flutter/material.dart';

class TugasTimePicker extends StatefulWidget {
  const TugasTimePicker({super.key});

  @override
  State<TugasTimePicker> createState() => _TugasTimePickerState();
}

class _TugasTimePickerState extends State<TugasTimePicker> {
TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Time Picker",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
          ),
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(20),
      child: Center(
        child: Column(
          children: [
            Text("Atur Pengingat"),
            // Text(Dateform),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
        
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  selectedTime = picked;
                  setState(() {});
                }
              },
              child: Text("Pilih Waktu Pengingat"),
            ),
            // Text("Pengingat diatur pukul: ${selectedTime!.format(context)} ")
            if (selectedTime != null)
              Text(
                "Pengingat diatur pukul: ${selectedTime!.format(context)}",
              ),
          ],
        ),
      ),
      ),
    );
  }
}