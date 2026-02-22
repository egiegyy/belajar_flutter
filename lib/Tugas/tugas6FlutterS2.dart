import 'package:flutter/material.dart';

class Tugas6SignUp extends StatelessWidget {
  const Tugas6SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child:
            //singleChildScrollView untuk membuat tampilan dapat di scroll
            //scrollDirection untuk mengatur arah scroll
            //physics untuk mengatur efek scroll
            SingleChildScrollView(
              child: Column(
                children: [
                  Image(
                    image: AssetImage("assets/images/logoFitGuide.png"),
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
                    child: Column(
                      children: [
                        TextField(
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
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 5,
                              ),
                            ),
                            //prefixIcon untuk menambahkan ikon di dalam textfield
                            prefixIcon: Icon(
                              Icons.person,
                              size: 20,
                              color: Colors.white,
                            ),
                            //hintText untuk memberikan petunjuk pada textfield saat belum diisi
                            hintText: "Please input your username",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            //labelText untuk memberikan label pada textfield saat di klik
                            labelText: "Username",
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          showCursor: true,
                          autofocus: true,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 5,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.email_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                            hintText: "Please input your email",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            labelText: "Email",
                          ),
                        ),

                        SizedBox(height: 10),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          showCursor: true,
                          autofocus: true,
                          obscureText: true,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 5,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                            hintText: "Please input your password",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            labelText: "Password",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Or Continue With",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.g_mobiledata_outlined,
                                  size: 40,
                                  color: Colors.red,
                                ),
                                Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.facebook_outlined,
                                size: 25,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 7),
                              Text(
                                "Continue with Facebook",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
