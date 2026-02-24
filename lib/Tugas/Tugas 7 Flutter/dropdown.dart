import 'package:flutter/material.dart';

class TugasDropDown extends StatefulWidget {
  const TugasDropDown({super.key});

  @override
  State<TugasDropDown> createState() => _TugasDropDownState();
}

class _TugasDropDownState extends State<TugasDropDown> {
  String? selectedDropdown;
  final List<String> kategoriProduk = ["Elektronik", "Pakaian", "Makanan", "Lainnya"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Drop Down",
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
            "Pilih Kategori Produk",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // Text(
            //   "Pilih Kategori Produk",
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold
            //   ),
            //   ),
            DropdownButtonFormField(
              initialValue: selectedDropdown,
              hint: Text("Pilih kategori"),
              items: kategoriProduk.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(), 
            onChanged: (value) {
              setState(() {
                selectedDropdown = value;
              });
            },
              ),
              if (selectedDropdown != null)
              Text("Anda memilih kategori: $selectedDropdown")
            ],
          )
        ],
      ),
       ),
    );
  }
}