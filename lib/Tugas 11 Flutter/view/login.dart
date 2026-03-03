import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas%2011%20Flutter/database/share_preference.dart';
import 'package:flutter_application_1/Tugas%2011%20Flutter/view/drawer3.dart';
import 'package:flutter_application_1/Tugas/Tugas%206%20Flutter/tugas6FlutterS3.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> handleLogin() async {
    if (!formKey.currentState!.validate()) return;

    final success = await SharePreference.login(
      username: usernameC.text,
      password: passwordC.text,
    );

    if (success) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Drawer3()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username / Password salah")),
      );
    }
  }

  Future<void> handleRegister() async {
    if (!formKey.currentState!.validate()) return;

    await SharePreference.register(
      username: usernameC.text,
      password: passwordC.text,
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Akun berhasil didaftarkan")));
  }

  @override
  void dispose() {
    usernameC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Sign In", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Image(
                  image: AssetImage("assets/images/logoFitGuide.png"),
                ),

                const SizedBox(height: 20),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      /// USERNAME
                      TextFormField(
                        controller: usernameC,
                        style: const TextStyle(color: Colors.white),
                        validator: (v) => v == null || v.isEmpty
                            ? "Username wajib diisi"
                            : null,
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: const TextStyle(color: Colors.white),
                          hintText: "Please input your username",
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// PASSWORD
                      TextFormField(
                        controller: passwordC,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        validator: (v) => v == null || v.length < 4
                            ? "Password minimal 4 karakter"
                            : null,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Colors.white),
                          hintText: "Please input your password",
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.lock_rounded,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text(
                            "Masuk",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: handleRegister,
                          child: const Text(
                            "Daftar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
