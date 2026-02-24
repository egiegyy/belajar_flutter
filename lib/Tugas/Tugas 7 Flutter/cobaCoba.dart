import 'package:flutter/material.dart';

// import halaman kamu
import 'checkbox.dart';
import 'switch.dart';
import 'dropdown.dart';
import 'datePicker.dart';
import 'timePicker.dart';

class CobaCoba extends StatelessWidget {
  const CobaCoba({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),

      // ⭐⭐⭐ DRAWER DI SINI
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            // HEADER
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "Menu Tugas",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),

            // ===== MENU 1 =====
            ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text("Checkbox"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TugasCheckbox(),
                  ),
                );
              },
            ),

            // ===== MENU 2 =====
            ListTile(
              leading: const Icon(Icons.toggle_on),
              title: const Text("Switch"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TugasSwitch(),
                  ),
                );
              },
            ),

            // ===== MENU 3 =====
            ListTile(
              leading: const Icon(Icons.arrow_drop_down_circle),
              title: const Text("Dropdown"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TugasDropDown(),
                  ),
                );
              },
            ),

            // ===== MENU 4 =====
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text("Date Picker"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TugasDatePicker(),
                  ),
                );
              },
            ),

            // ===== MENU 5 =====
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text("Time Picker"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TugasTimePicker(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // BODY HOME
      body: const Center(
        child: Text(
          "Selamat datang di Home",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}