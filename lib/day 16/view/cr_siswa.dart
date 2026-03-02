import 'package:flutter/material.dart';
import 'package:flutter_application_1/day%2016/database/siswa_controller.dart';
import 'package:flutter_application_1/day%2016/model/siswa_model.dart';
import 'package:flutter_application_1/day%2016/utils/decoration_form.dart';

class CrSiswa extends StatefulWidget {
  const CrSiswa({super.key});

  @override
  State<CrSiswa> createState() => _CrSiswaState();
}

class _CrSiswaState extends State<CrSiswa> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Pendaftaran",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: decorationConstant(hintText: "Masukan Nama Siswa"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: kelasController,
              decoration: decorationConstant(hintText: "Masukan kelas Siswa"),
            ),
            TextFormField(
              controller: nameController,
              decoration: decorationConstant(hintText: "Masukan Nama Siswa"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: kelasController,
              decoration: decorationConstant(hintText: "Masukan kelas Siswa"),
            ),

            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Nama belum di isi")));
                  return;
                }
                if (kelasController.text.isEmpty) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Kelas belum di isi")));
                  return;
                }
                SiswaController.registerSiswa(
                  SiswaModel(
                    nama: nameController.text,
                    kelas: kelasController.text,
                  ),
                );
                nameController.clear();
                kelasController.clear();
                setState(() {});
              },
              child: Text("Tambah Siswa"),
            ),
          ],
        ),
      ),
    );
  }
}

FutureBuilder<List<SiswaModel>> siswaWidget() {
  return FutureBuilder<List<SiswaModel>>(
    future: SiswaController.getAllSiswa(),

    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }
      final dataSiswa = snapshot.data as List<SiswaModel>;
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: dataSiswa.length,
        itemBuilder: (BuildContext context, int index) {
          final items = dataSiswa[index];
          return ListTile(title: Text(items.nama), subtitle: Text(items.kelas));
        },
      );
    },
  );
}
