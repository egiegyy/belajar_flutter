import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%206%20Flutter/tugas6FlutterS3.dart';
import 'package:flutter_application_1/day%2016/view/loginpage.dart';
import 'package:flutter_application_1/day%2016/database/preference.dart';
import 'package:flutter_application_1/extention/navigator.dart';

class SplashScreenDay16 extends StatefulWidget {
  const SplashScreenDay16({super.key});

  @override
  State<SplashScreenDay16> createState() => _SplashScreenDay16State();
}

class _SplashScreenDay16State extends State<SplashScreenDay16> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    bool? data = await PreferenceHandler.getIsLogin();
    print(data);
    print("Hai, Joshua");
    if (data == true) {
      context.pushAndRemoveAll(HomePage());
    } else {
      context.pushAndRemoveAll(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset("assets/images/logo_setetes.png")],
      ),
    );
  }
}
