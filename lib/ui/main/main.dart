import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.white,
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: appBarActions(),
        title: buildCircleImage(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildBodyHeader(),

            buildCardview(
                context,
                Colors.orange,
                "Design Highway",
                "Senior for designers\nana design leads",
                "22.05.2021",
                "Fethiye",
                "15",
                "Emre\nERGÜN"),

            buildCardview(
                context,
                Colors.lightBlue,
                "Ölüdeniz Beach",
                "Summer beach\nAll coctails",
                "25.05.2021",
                "Dalaman",
                "Free",
                "Yunus\nERGÜN"),

            buildCardview(
                context,
                Colors.lightGreen,
                "Design Highway",
                "Senior for designers\nana design leads",
                "22.05.2021",
                "Fethiye",
                "15",
                "Emre\nERGÜN"),

            buildCardview(
                context,
                Colors.purple,
                "Design Highway",
                "Senior for designers\nana design leads",
                "22.05.2021",
                "Fethiye",
                "15",
                "Emre\nERGÜN"),


          ],
        ),
      ),
    );
  }

  Center buildCardview(BuildContext context,MaterialColor materialColor, String header, String subHeader,
      String date, String location, String price, String cardName) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        height: MediaQuery.of(context).size.height * 0.40,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.orange,
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [materialColor.shade900, materialColor.shade300])),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: Text(
                header,
                style:
                    GoogleFonts.nunitoSans(fontSize: 40, color: Colors.white),
              ),
            ),
            Positioned(
              top: 70,
              left: 20,
              child: Text(
                subHeader,
                style: GoogleFonts.nunitoSans(
                  fontSize: 20,
                  color: Colors.white70,
                  height: 0.9,
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Text(
                "Location : $location",
                style: GoogleFonts.nunitoSans(
                  color: Colors.white70,
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 20,
              child: Text(
                "Date : $date",
                style: GoogleFonts.nunitoSans(
                  color: Colors.white70,
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: materialColor.shade700),
                child: Text(
                  "\$ $price",
                  style: GoogleFonts.nunitoSans(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              right: 20,
              child: Text(
                cardName,
                textAlign: TextAlign.end,
                style: GoogleFonts.nunitoSans(
                    color: Colors.white10, fontSize: 70, height: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // < Back Professional events
  Container buildBodyHeader() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.chevron_left)),
              Text(
                "Back",
                style: GoogleFonts.lato(
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
          Container(
            width: 50,
          ),
          Text(
            "Professional events",
            style: GoogleFonts.lato(
              fontSize: 22,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  // Actions
  List<Widget> appBarActions() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "California",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_arrow_down_rounded),
          )
        ],
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search),
      ),
      Container(
        width: 10,
      )
    ];
  }

  // Circle image
  ClipRRect buildCircleImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(color: Colors.lightBlue),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.asset(
              'assets/images/emre.png',
              height: 35,
              width: 35,
            ),
          ),
        ],
      ),
    );
  }
}
