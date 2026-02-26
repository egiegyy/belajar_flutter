import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_15/homepage.dart';
import 'package:ppkd_b_5/extension/navigator.dart';

class TextFormDay15 extends StatefulWidget {
  const TextFormDay15({super.key});

  @override
  State<TextFormDay15> createState() => _TextFormDay15State();
}

class _TextFormDay15State extends State<TextFormDay15> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVisibility = false;
  void visibilityOnOff() {
    isVisibility = !isVisibility;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                ),
                errorStyle: TextStyle(color: Colors.amber),
                border: OutlineInputBorder(),
                hintText: "Masukkan email Anda",
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email tidak boleh kosong";
                } else if (!value.contains("@")) {
                  return "Email tidak valid";
                } else {
                  return null;
                }
              },
            ),
            spaceHeight(24),

            TextFormField(
              obscureText: isVisibility,
              obscuringCharacter: "♡",
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukkan Password Anda",
                labelText: "Password",
                prefixIcon: Icon(Icons.key),
                suffixIcon: InkWell(
                  onTap: visibilityOnOff,
                  child: Icon(
                    !isVisibility ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              controller: passwordController,
              validator: (value) {
                final password = value ?? '';
                if (password.isEmpty) {
                  return "Password tidak boleh kosong";
                }
                if (password.length < 6) {
                  return "Password minimal 6 karakter";
                }

                final hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
                final hasLowercase = RegExp(r'[a-z]').hasMatch(password);
                final hasNumber = RegExp(r'\d').hasMatch(password);
                final hasSpecialChar = RegExp(
                  r'[!@#$%^&*(),.?":{}|<>_\-\\/\[\];\`~+=]',
                ).hasMatch(password);

                if (!hasUppercase) {
                  return "Password harus mengandung minimal 1 huruf besar";
                }
                if (!hasLowercase) {
                  return "Password harus mengandung minimal 1 huruf kecil";
                }
                if (!hasNumber) {
                  return "Password harus mengandung minimal 1 angka";
                }
                if (!hasSpecialChar) {
                  return "Password harus mengandung minimal 1 karakter spesial";
                }

                return null;
              },
            ),
            spaceHeight(24),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                ),
                errorStyle: TextStyle(color: Colors.amber),
                border: OutlineInputBorder(),
                hintText: "Masukkan Nomor Telepon Anda",
                labelText: "Nomor Telepon",
                prefixIcon: Icon(Icons.phone),
              ),
              controller: phoneController,
              validator: (value) {
                final phone = (value ?? '').trim();
                if (phone.isEmpty) {
                  return "Nomor telepon tidak boleh kosong";
                }
                if (!RegExp(r'^\d+$').hasMatch(phone)) {
                  return "Nomor telepon hanya boleh angka";
                }
                if (phone.length < 9) {
                  return "Nomor telepon minimal 9 digit";
                }
                if (phone.length > 15) {
                  return "Nomor telepon maksimal 15 digit";
                }
                return null;
              },
            ),
            spaceHeight(24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Berhasil tervalidasi");
                    context.push(HomepageDay15(text: emailController.text));
                    if (emailController.text != "projecthabibie@gmail.co") {
                      print("Email salah");
                      dialogError(context);
                    }
                  } else {
                    print("Tidak Berhasil tervalidasi");
                  }
                  print(emailController.text);
                  // print(emailController);
                  print(passwordController.text);
                },
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> dialogError(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Warning", style: TextStyle(fontSize: 24)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Email yang anda masukkan salah"),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text("Oke,"),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text("Lanjut"),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // actions: [
          //   ElevatedButton(
          //     onPressed: () {
          //       context.pop();
          //     },
          //     child: Text("Oke, ga masalah kok"),
          //   ),
          //   ElevatedButton(
          //     onPressed: () {
          //       context.pop();
          //     },
          //     child: Text("Lanjut aja dong"),
          //   ),
          // ],
        );
      },
    );
  }

  SizedBox spaceHeight(double value) => SizedBox(height: value);