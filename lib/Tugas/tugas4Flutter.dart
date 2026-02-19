import 'package:flutter/material.dart';

class Tugas4flutter extends StatelessWidget {
  const Tugas4flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Progress",
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
      ListView(
        children: [
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
                        prefixIcon: Icon(Icons.person, size: 20, color: Colors.white, ),
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
                        prefixIcon: Icon(Icons.numbers_rounded, size: 20, color: Colors.white, ),
                        hintText: "Please input your age",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                        labelText: "Age",
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
                        prefixIcon: Icon(Icons.scale, size: 20, color: Colors.white, ),
                        hintText: "Please input your weight",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                        labelText: "Weight",
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
                        prefixIcon: Icon(Icons.height_rounded, size: 20, color: Colors.white),
                        hintText: "Please input your height",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                        labelText: "Height",
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
                padding: EdgeInsets.all(10),
                child: 
                ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Icon(Icons.person, size: 40, color: Colors.white),
                  title: Text(
                    "Fayreen Zenisha",
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  subtitle: Text(
                    "Bulan Januari, Fayreen Zenisha telah melakukan olahraga sebanyak 5 kali dan berhasil menurunkan berat badan sebanyak 1,3 kg",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                "More",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
            ),
            ),
            SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(10),
                child: 
                ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Icon(Icons.person, size: 40, color: Colors.white),
                  title: Text(
                    "Fayreen Zenisha",
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  subtitle: Text(
                    "Bulan Febuari, Fayreen Zenisha telah melakukan olahraga sebanyak 5 kali dan berhasil menurunkan berat badan sebanyak 1,3 kg",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                "More",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
            ),
            ),
            SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(10),
                child: 
                ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Icon(Icons.person, size: 40, color: Colors.white),
                  title: Text(
                    "Fayreen Zenisha",
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  subtitle: Text(
                    "Bulan Maret, Fayreen Zenisha telah melakukan olahraga sebanyak 5 kali dan berhasil menurunkan berat badan sebanyak 1,3 kg",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                "More",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
            ),
            ),
            SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(10),
                child: 
                ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Icon(Icons.person, size: 40, color: Colors.white),
                  title: Text(
                    "Fayreen Zenisha",
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  subtitle: Text(
                    "Bulan April, Fayreen Zenisha telah melakukan olahraga sebanyak 5 kali dan berhasil menurunkan berat badan sebanyak 1,3 kg",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                "More",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
            ),
            ),
          ],
        )
      )
    );
  }
}