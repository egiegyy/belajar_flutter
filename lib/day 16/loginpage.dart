import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%206%20Flutter/tugas6FlutterS3.dart';
import 'package:flutter_application_1/day%2016/database/preference.dart';
import 'package:flutter_application_1/day%2016/database/sqflite.dart';
import 'package:flutter_application_1/day%2016/model/user_model.dart';
import 'package:flutter_application_1/extention/navigator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Sign In",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: 
      Padding(padding: EdgeInsetsGeometry.all(20),
      child: 
        //singleChildScrollView untuk membuat tampilan dapat di scroll
        //scrollDirection untuk mengatur arah scroll
        //physics untuk mengatur efek scroll
        SingleChildScrollView(
          child: Column(
            children: [
              Image(image: AssetImage("assets/images/logoFitGuide.png"),
              alignment: Alignment.topCenter,
              ),
              Container(
                alignment: Alignment.center,
                //decoration untuk memberikan dekorasi pada container
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(20),
                child: 
                Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      //showCursor untuk menampilkan kursor pada textfield jika aktif
                      showCursor: true,
                      //autofocus untuk membuat textfield otomatis aktif saat pertama kali dibuka
                      autofocus: true,
                      //mengatur posisi text pada textfield
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15), 
                          borderSide: BorderSide
                          (color: Colors.white, 
                          width: 5
                          )
                        ),
                        //prefixIcon untuk menambahkan ikon di dalam textfield
                        prefixIcon: Icon(Icons.email, size: 20, color: Colors.white),
                        //hintText untuk memberikan petunjuk pada textfield saat belum diisi 
                        hintText: "Please input your email",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                        //labelText untuk memberikan label pada textfield saat di klik
                        labelText: "Email",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                        return "Email tidak boleh kosong";
                        } else if (!value.contains("@")) {
                        return "Email tidak valid";
                        } else {
                        return null;
                        }
                      }
                    ),

                    //tombol masuk
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      showCursor: true,
                      autofocus: true,
                      obscureText: true,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15), 
                          borderSide: BorderSide
                          (color: Colors.white, 
                          width: 5
                          )
                        ),
                        prefixIcon: Icon(Icons.lock_rounded, size: 20, color: Colors.white),
                        hintText: "Please input your password",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                        labelText: "Password",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {}, 
                        child: Text("Forget Password?",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            ),
                          )
                        ),
                      ],
                    ),

                    //tombol masuk
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue 
                        ),
                        onPressed: () async {
                          // FormFieldValidator
                          final UserModel? login = await DBHelper.loginUser(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          print(login?.email);
                          print(login?.id);
                          print(login?.password);
                          if (login != null) {
                            PreferenceHandler().storingIsLogin(true);
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text("Login berhasill")));
                            await Future.delayed(Duration(seconds: 2));
                            context.push(HomePage());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Login gagal, email atau password tidak terdaftar"
                                )
                              )
                            );
                          }
                        },
                        child: Text(
                          "Masuk", 
                        style: 
                        TextStyle(
                          color: Colors.white, 
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                          )
                        )
                      ),
                    ),

                      //tombol daftar/register
                      SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey 
                        ),
                        onPressed: () {
                          DBHelper.registUser(
                            UserModel(
                              email: emailController.text,
                              password: passwordController.text
                            )
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Pendaftaran Berhasil"))
                          );
                        }, 
                        child: Text(
                        "Daftar", 
                        style: 
                        TextStyle(
                          color: Colors.white, 
                          fontSize: 14,
                          fontWeight: FontWeight.bold)
                        )
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              // Container(
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     color: Colors.grey.withValues(alpha: 0.2),
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   padding: EdgeInsets.all(20),
              //   child: 
              //   Column(
              //     children: [
              //       Text(
              //         "Or Continue With",
              //         style: 
              //         TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white,
              //         ),
              //       ),
              //       SizedBox(height: 10),
              //       SizedBox(
              //         width: double.infinity,
              //         child: 
              //         OutlinedButton(
              //           onPressed: () {}, 
              //           child: 
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Icon(Icons.g_mobiledata_outlined, size: 40, color: Colors.red),
              //               Text(
              //                 "Continue with Google", 
              //                 style: 
              //                 TextStyle(
              //                   color: Colors.white, 
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.bold
              //                 )
              //               ),
              //             ],
              //           ),
              //         )
              //       ),
              //       OutlinedButton(
              //           onPressed: () {}, 
              //           child: 
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Icon(Icons.facebook_outlined, size: 25, color: Colors.blue),
              //               SizedBox(width: 7),
              //               Text(
              //                 "Continue with Facebook", 
              //                 style: 
              //                 TextStyle(
              //                   color: Colors.white, 
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.bold
              //                 )
              //               ),
              //             ],
              //           ),
              //         ),
              //     ]
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}