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
                          borderSide: BorderSide
                          (color: Colors.white, 
                          width: 5
                          )
                        ),
                        //prefixIcon untuk menambahkan ikon di dalam textfield
                        prefixIcon: Icon(Icons.person, size: 20, color: Colors.white),
                        //hintText untuk memberikan petunjuk pada textfield saat belum diisi 
                        hintText: "Please input your name",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                        //labelText untuk memberikan label pada textfield saat di klik
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
                    //crossAxisCount untuk mengatur jumlah kolom pada gridview jika lebih akan turun
                    crossAxisCount: 3,
                    //mengatur jarak vertikal antar gridview
                    mainAxisSpacing: 5,
                    //mengatur jarak horizontal antar gridview
                    crossAxisSpacing: 5,
                    children: [
                      //Stack untuk menumpuk widget di atas widget lain
                      Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          Container(
                            //double.infinity untuk membuat ukuran container mengikuti ukuran parentnya
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