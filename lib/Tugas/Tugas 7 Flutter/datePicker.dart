import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TugasDatePicker extends StatefulWidget {
  const TugasDatePicker({super.key});

  @override
  State<TugasDatePicker> createState() => _TugasDatePickerState();
}

class _TugasDatePickerState extends State<TugasDatePicker> {
  String formatTanggal(DateTime date) {
  return DateFormat('d MMMM yyyy').format(date);
}
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Date Picker",
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
            Text("Pilih Tanggal Lahir"),
            // Text(selectedDate.toString()),
            // Text(Dateform),
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2027),
                  initialDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              child: Text("Pilih Tanggal Lahir"),
            ),
            if (selectedDate != null)
            Text(
              "Tanggal lahir: ${formatTanggal(selectedDate!)}",
            ),
            // Text("Tanggal lahir: ${formatTanggal(selectedDate!)}")
          ],
        ),
      ),
      ),
    );
  }
}