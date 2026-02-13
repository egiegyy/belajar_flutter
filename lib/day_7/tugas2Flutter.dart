import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tugas2flutter extends StatelessWidget {
  const Tugas2flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //nomor 1
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Profile Saya",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        //nomor 2
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          children: [
              Center(
              child: Text("Salsabil Trainer",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),  
          ),
          Center(
            child: 
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.brown
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("salsabilbutterfly@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white
                  ),),
                  SizedBox(width: 20),
                  Icon(Icons.import_contacts,
                  color: Colors.white)
                ],
              ),
            ),
          ),
          //nomor 4
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.lightGreen
            ),
            child: Row(
              children: [
                Text("08**12345678",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                  ),
                ),
                Spacer(flex: 1,),
                Icon(Icons.call)
              ],
            )
          ),
          //nomor 5
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child:
                    Container(
                      color: Colors.blueGrey,
                      child: Text("Skill",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ),
                    Expanded(
                    child:
                    Container(
                      color: Colors.amberAccent,
                      child: Text("Sertifikasi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ),
                ],
              )
            ),
          ),
          //nomor 6
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Salsabil berpengalaman dalam melatih.\n" "mantap lah pokoknya.",
                  style: TextStyle(
                    fontSize: 15,
                  )
                )
              ],
            ),
          ),
          Container(
            height: 200,
            width: 200,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              image: DecorationImage(
                image: AssetImage("assets/images/contohajalah.png"),
                fit: BoxFit.contain
                ),
            ),
           ),
        ],
      ),
    );
  }
}

         