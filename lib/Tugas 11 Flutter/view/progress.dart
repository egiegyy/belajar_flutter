import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas%2011%20Flutter/controller/progress_controller.dart';
import 'package:flutter_application_1/Tugas%2011%20Flutter/utils/decoration_form.dart';
import '../model/progress_model.dart';

class ProgressUI extends StatefulWidget {
  const ProgressUI({super.key});

  @override
  State<ProgressUI> createState() => _ProgressUIState();
}

class _ProgressUIState extends State<ProgressUI> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  Future<void> saveData() async {
    if (nameController.text.isEmpty ||
        ageController.text.isEmpty ||
        weightController.text.isEmpty ||
        heightController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Semua field wajib diisi")));
      return;
    }

    final data = ProgressModel(
      name: nameController.text,
      age: ageController.text,
      weight: weightController.text,
      height: heightController.text,
    );

    await UserController.insertUser(data);

    nameController.clear();
    ageController.clear();
    weightController.clear();
    heightController.clear();

    setState(() {});
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Progress",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), // ✅ FIX
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    style: const TextStyle(color: Colors.white),
                    autofocus: false,
                    decoration: decorationConstant(
                      hintText: "Please input your name",
                      labelText: "Name",
                      prefixIcon: Icons.person,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    autofocus: false,
                    decoration: decorationConstant(
                      hintText: "Please input your age",
                      labelText: "Age",
                      prefixIcon: Icons.numbers_rounded,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    autofocus: false,
                    decoration: decorationConstant(
                      hintText: "Please input your weight",
                      labelText: "Weight",
                      prefixIcon: Icons.scale,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    autofocus: false,
                    decoration: decorationConstant(
                      hintText: "Please input your height",
                      labelText: "Height",
                      prefixIcon: Icons.height_rounded,
                    ),
                  ),
                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: saveData,
                      child: const Text("Simpan"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _listData(),
          ],
        ),
      ),
    );
  }

  Widget _listData() {
    return FutureBuilder<List<ProgressModel>>(
      future: UserController.getAllUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada data",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        final data = snapshot.data!;

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final item = data[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.white,
                ),
                title: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  "Age ${item.age} | Weight ${item.weight} | Height ${item.height} ",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
