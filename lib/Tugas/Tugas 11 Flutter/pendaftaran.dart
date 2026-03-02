import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%2011%20Flutter/modelt11.dart';
import 'package:flutter_application_1/Tugas/Tugas%2011%20Flutter/user_controller.dart';
import 'package:flutter_application_1/day%2016/utils/decoration_form.dart';

class PendaftaranPage extends StatefulWidget {
  const PendaftaranPage({super.key});

  @override
  State<PendaftaranPage> createState() => _PendaftaranPageState();
}

class _PendaftaranPageState extends State<PendaftaranPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  bool isVisibility = false;
  void visibilityOnOff() {
    setState(() {
      isVisibility = !isVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Tugas 11 Flutter",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(50),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: nameController,
                      decoration: decorationConstant(
                        hintText: "Masukan Nama Anda",
                        prefixIcon: Icons.person,
                        labelText: "Nama",
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: emailController,
                      decoration: decorationConstant(
                        hintText: "Masukan Email Anda",
                        prefixIcon: Icons.email_rounded,
                        labelText: "Email",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email tidak boleh kosong";
                        }

                        final emailRegex = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );

                        if (!emailRegex.hasMatch(value)) {
                          return "Format email tidak valid";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: passwordController,
                      obscureText: isVisibility,
                      decoration: decorationConstant(
                        hintText: "Masukan Password Anda",
                        prefixIcon: Icons.key_rounded,
                        labelText: "Password",
                        suffixIcon: InkWell(
                          onTap: visibilityOnOff,
                          child: Icon(
                            isVisibility
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password tidak boleh kosong";
                        }
                        if (value.length < 6) {
                          return "Password minimal 6 karakter";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: phoneController,
                      decoration: decorationConstant(
                        hintText: "Masukan Nomor Anda",
                        prefixIcon: Icons.phone,
                        labelText: "Nomor Hp",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Isi nomor telepon";
                        }
                        if (value.length < 10) {
                          return "Nomor minimal 10 angka";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: cityController,
                      decoration: decorationConstant(
                        hintText: "Masukan Kota Asal Anda",
                        prefixIcon: Icons.location_pin,
                        labelText: "Asal kota",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {}
                  if (nameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Nama belum di isi")),
                    );
                    return;
                  }
                  if (emailController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Kelas belum di isi")),
                    );
                    return;
                  }
                  if (passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Password belum di isi")),
                    );
                    return;
                  }
                  if (phoneController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Nomor Telepon belum di isi")),
                    );
                    return;
                  }
                  if (cityController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Kota Asal belum di isi")),
                    );
                    return;
                  }

                  UserController.registerUser(
                    UserModeltugas(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      phone: phoneController.text,
                      city: cityController.text,
                    ),
                  );
                  // nameController.clear();
                  // emailController.clear();
                  // passwordController.clear();
                  // phoneController.clear();
                  // cityController.clear();
                  setState(() {});
                },
                child: Text("Tambah User"),
              ),
              userWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

FutureBuilder<List<UserModeltugas>> userWidget() {
  return FutureBuilder<List<UserModeltugas>>(
    future: UserController.getAlluser(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      print(snapshot.hasData);
      if (!snapshot.hasData) {
        return const Center(child: CircularProgressIndicator());
      }

      final dataUser = snapshot.data as List<UserModeltugas>;

      if (dataUser.isEmpty) {
        return const Center(
          child: Text("Belum ada data", style: TextStyle(color: Colors.white)),
        );
      }

      return ListView.builder(
        itemCount: dataUser.length,
        itemBuilder: (BuildContext context, int index) {
          final items = dataUser[index];
          return ListTile(
            title: Text(
              items.name ?? '',
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              items.email ?? '',
              style: const TextStyle(color: Colors.white70),
            ),
          );
        },
      );
    },
  );
}
