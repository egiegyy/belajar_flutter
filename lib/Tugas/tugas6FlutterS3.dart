import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back_rounded, color: Colors.white, size: 30),
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        actions: [Icon(Icons.search_rounded, color: Colors.white, size: 30)],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Halo Faza,",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                "today is your Push Day!",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              SizedBox(height: 20),
              // ignore: avoid_unnecessary_containers
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Image.asset(
                          "assets/images/posterCompetition.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 200,
                      width: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Image.asset(
                          "assets/images/posterCompetition2.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Your routine",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              //row untuk nanti dibuat scroll horizontal
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //tabel rutinitas user 1
                    Container(
                      // height: 100,
                      width: 150,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Push Day",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "apa aja nanti latihannya disini aja ya ges ya ketiknya",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Align(
                            alignment: AlignmentGeometry.bottomRight,
                            child: TextButton(
                              style: ButtonStyle(),
                              onPressed: () {},
                              child: Text(
                                "More",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    //tabel rutinitas user 2
                    Container(
                      // height: 100,
                      width: 150,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Pull Day",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "apa aja nanti latihannya disini aja ya ges ya ketiknya",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Align(
                            alignment: AlignmentGeometry.bottomRight,
                            child: TextButton(
                              style: ButtonStyle(),
                              onPressed: () {},
                              child: Text(
                                "More",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    //tabel rutinitas user 3
                    Container(
                      // height: 100,
                      width: 150,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Leg Day",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "apa aja nanti latihannya disini aja ya ges ya ketiknya",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Align(
                            alignment: AlignmentGeometry.bottomRight,
                            child: TextButton(
                              style: ButtonStyle(),
                              onPressed: () {},
                              child: Text(
                                "More",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    //tabel rutinitas user 4
                    Container(
                      // height: 100,
                      width: 150,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Upper Day",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "apa aja nanti latihannya disini aja ya ges ya ketiknya",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Align(
                            alignment: AlignmentGeometry.bottomRight,
                            child: TextButton(
                              style: ButtonStyle(),
                              onPressed: () {},
                              child: Text(
                                "More",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Package Exercise",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                contentPadding: EdgeInsets.all(5),
                leading: Image.asset("assets/images/ContohPushPullLeg.png"),
                title: Text(
                  "Push Pull Leg",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  "Push Pull Leg is a workout split that groups exercises based on movement patterns: Push trains chest, shoulders, and triceps; Pull trains back and biceps; and Leg focuses on lower body muscles like thighs and glutes.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: TextButton(
                  style: ButtonStyle(),
                  onPressed: () {},
                  child: Text("More", style: TextStyle(color: Colors.blue)),
                ),
              ),
              Divider(),
              ListTile(
                contentPadding: EdgeInsets.all(5),
                leading: Image.asset("assets/images/ContohPushPullLeg.png"),
                title: Text(
                  "Upper Body",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  "Push Pull Leg is a workout split that groups exercises based on movement patterns: Push trains chest, shoulders, and triceps; Pull trains back and biceps; and Leg focuses on lower body muscles like thighs and glutes.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: TextButton(
                  style: ButtonStyle(),
                  onPressed: () {},
                  child: Text("More", style: TextStyle(color: Colors.blue)),
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
