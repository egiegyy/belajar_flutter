import 'package:flutter/material.dart';

class Tugas5flutter extends StatefulWidget {
  // StatefulWidget untuk membuat widget yang dapat berubah-ubah sesuai dengan interaksi pengguna
  const Tugas5flutter({super.key});

  @override
  //createState untuk membuat state dari widget yang akan digunakan untuk menyimpan data yang dapat berubah-ubah
  State<Tugas5flutter> createState() => _Tugas5flutterState();
}

class _Tugas5flutterState extends State<Tugas5flutter> {
  //deklarasi variabel untuk menyimpan data yang dapat berubah-ubah
  bool showImage = false;
  bool bookmark = false;
  bool isSaved = false;
  int _counter = 0;

  //fungsi untuk mengurangi nilai counter dan mencetak nilai counter ke console
  void decrement() {
    _counter--;
    print("Nilai dari _Counter :$_counter");
    setState(() {});
  }
  //fungsi untuk menambah nilai counter dan mencetak nilai counter ke console dengan parameter textPrint untuk mencetak teks tambahan saat fungsi dipanggil
  void increment({String? textPrint}) {
    _counter++;
    print("Nilai dari _Counter :$_counter");
    print("$textPrint :$_counter");
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: 
      AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: 
        Text(
          "Exercise",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        )
      ),
      body: 
      Padding(
        padding: EdgeInsets.all(20),
        child:
        SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                 Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListTile(
                            contentPadding: EdgeInsets.all(5),
                            leading: Image.asset("assets/images/ContohPushPullLeg.png"),
                            title: Text(
                              "Push Pull Leg",
                              style: TextStyle(
                                fontSize: 20, 
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            subtitle: Text(
                              "Push Pull Leg is a workout split that groups exercises based on movement patterns: Push trains chest, shoulders, and triceps; Pull trains back and biceps; and Leg focuses on lower body muscles like thighs and glutes.",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.white
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: 
                            // ElevatedButton untuk membuat tombol dengan tampilan yang lebih menarik dan dapat diatur sesuai kebutuhan
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    //showImage untuk menampilkan dan menyembunyikan gambar saat tombol ditekan
                                    showImage = !showImage;
                                  }
                                );
                              }, 
                              //child untuk menampilkan teks pada tombol yang berubah sesuai dengan kondisi showImage dengan boolean
                              child: Text(showImage ? "Less" : "More",
                              style: 
                              TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue
                              ),
                              ),
                            
                      ) 
                    ),
                  ),
                  SizedBox(height: 20),
                  // Nomor 1 (bisa menampilkan dan menyembunyikan gambar)
                  //kondisi untuk menampilkan gambar jika showImage bernilai true
                  if (showImage)
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              // Nomor 4 menggunakan inkWell untuk menampilkan warna dan menampilkan teks saat ditekan dengan inkWell yang membungkus widget gambar dan teks yang ingin ditampilkan saat gambar ditekan
                              InkWell(
                                splashColor: Colors.blue.withAlpha(100),
                                onTap: () {
                                  print("Gambar ditekan");
                                },
                                child: 
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset("assets/images/ContohPushPullLeg.png"),
                                )
                                ),
                              SizedBox(height: 10),
                              Text(
                                "Push Pull Leg is a workout split that groups exercises based on movement patterns: Push trains chest, shoulders, and triceps; Pull trains back and biceps; and Leg focuses on lower body muscles like thighs and glutes.",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                //space between untuk memberikan jarak antara widget yang berada di kiri dan kanan dengan widget yang berada di tengah
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Nomor 3 (membuat tombol dengan TextButton)
                                  TextButton(onPressed: () {
                                  }, child: Text(
                                    "Workoout Now",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    )
                                  ),
                                  Text("$_counter", 
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                    )
                                  ),
                                  Column(
                                    children: [
                                      // Nomor 2 (Icon berubah warna dan muncul teks saat ditekan)
                                      IconButton(onPressed: () {
                                        setState(() {
                                          bookmark = !bookmark;
                                          isSaved = !isSaved;
                                          });
                                        },
                                      icon: Icon(
                                        Icons.bookmark, 
                                        //color berubah sesuai dengan kondisi bookmark dengan boolean
                                        color: bookmark ? Colors.blue : Colors.grey, 
                                        size: 30) 
                                      ),
                                      // kondisi untuk menampilkan teks "Saved" jika isSaved bernilai true
                                      if (!isSaved)
                                        Text(
                                          "Saved",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "COBA TEKAN GAMBAR",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                              // Nomor 5 
                              // GestureDetector untuk membuat widget yang dapat mendeteksi berbagai jenis interaksi pengguna seperti tap, double tap, long press, dan lain-lain dengan membungkus widget yang ingin dideteksi interaksinya
                              GestureDetector(
                                onTap: decrement, //memanggil fungsi decrement saat widget ditekan
                                onDoubleTap: () {
                                  increment(textPrint: "On Double Press"); //memanggil fungsi increment dengan parameter textPrint saat widget ditekan dua kali
                                },
                                onLongPress: () {
                                increment(textPrint: "On long Press");
                                },
                                child: 
                                Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Image.asset("assets/images/contohajalah.png")
                                ),
                            ),
                                  ],
                                ),
                              ),
                              FloatingActionButton(
                              onPressed: () {},
                              child: Icon(Icons.add)
                              )
                          ],
                      ),
                              SizedBox(height: 10),
      //                     floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.qr_code),
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}