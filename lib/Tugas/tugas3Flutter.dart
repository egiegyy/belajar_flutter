import 'package:flutter/material.dart';

class Tugas3flutter extends StatelessWidget {
  const Tugas3flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Tugas 3 Flutter",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: 
      Padding(padding: EdgeInsetsGeometry.all(30),
      child: 
        SingleChildScrollView(
          child: Column(
            children: [
              Image(image: AssetImage("assets/images/logoFitGuide.png"),
              alignment: Alignment.topCenter,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(20),
                child: 
                Column(
                  children: [
                    TextField(
                      style: TextStyle(color: Colors.white),
                      showCursor: true,
                      autofocus: true,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15), 
                          borderSide: BorderSide
                          (color: Colors.white, 
                          width: 5
                          )
                        ),
                        prefixIcon: Icon(Icons.person, size: 20, color: Colors.white),
                        hintText: "Please input your name",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                        labelText: "Name",
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
                          borderSide: BorderSide
                          (color: Colors.white, 
                          width: 5
                          )
                        ),
                        prefixIcon: Icon(Icons.email_rounded, size: 20, color: Colors.white, ),
                        hintText: "Please input your email",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                        labelText: "Email",
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
                          borderSide: BorderSide
                          (color: Colors.white, 
                          width: 5
                          )
                        ),
                        prefixIcon: Icon(Icons.phone, size: 20, color: Colors.white, ),
                        hintText: "Please input your phone number",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                        labelText: "Phone Number",
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
                    SizedBox(height: 10)
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
                child: 
                Column(
                  children: [
                    Text(
                      "Sign Up With",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    children: [
                      Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Icon(Icons.facebook, size: 30, color: Colors.white),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Icon(Icons.g_mobiledata_rounded, size: 30, color: Colors.white),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Icon(Icons.snapchat_outlined, size: 30, color: Colors.white),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Icon(Icons.facebook, size: 30, color: Colors.white),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Icon(Icons.g_mobiledata_rounded, size: 30, color: Colors.white),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Icon(Icons.snapchat_outlined, size: 30, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}