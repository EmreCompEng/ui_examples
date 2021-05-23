import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_examples/ui/main/components/gradients.dart';
import 'components/animatedContainer.dart';

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
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  // CardView height
  double _cardHeight = 50;
  double _cardWidht = 50;

  @override
  Widget build(BuildContext context) {
    // CardView height
    this._cardHeight = MediaQuery.of(context).size.height * 0.40;
    this._cardWidht = MediaQuery.of(context).size.width * 0.90;

    return Scaffold(
      key: _drawerKey,
      appBar: buildAppBar(),
      drawer: buildDrawer(),
      body: buildBody(context),
    );
  }

  SingleChildScrollView buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedCard(
              color: Colors.grey,
              cardHeight: _cardHeight,
              header: "Buffalo Burger",
              subheader: "This is dummy subHeader\ndesigned by Emre Ergün",
              date: "22.05.2021",
              location: "Fethiye",
              price: "15",
              userName: "Emre\nERGÜN",imagePath: 'assets/images/foto1.jpg'
          ),
          AnimatedCard(
              color: Colors.pink,
              cardHeight: _cardHeight,
              header: "Design Highway",
              subheader: "This is dummy subHeader\ndesigned by Emre Ergün",
              date: "22.05.2021",
              location: "Fethiye",
              price: "15",
              userName: "Emre\nERGÜN",
              imagePath: 'assets/images/foto2.jpg'
          ),

          AnimatedCard(
              color: Colors.lightGreen,
              cardHeight: _cardHeight,
              header: "Design Highway",
              subheader: "This is dummy subHeader\ndesigned by Emre Ergün",
              date: "22.05.2021",
              location: "Fethiye",
              price: "15",
              userName: "Emre\nERGÜN",
              imagePath: 'assets/images/foto3.jpg'
          ),
          AnimatedCard(
              color: Colors.blue,
              cardHeight: _cardHeight,
              header: "Design Highway",
              subheader: "This is dummy subHeader\ndesigned by Emre Ergün",
              date: "22.05.2021",
              location: "Fethiye",
              price: "15",
              userName: "Emre\nERGÜN",
              imagePath: "assets/images/foto4.jpg"
          ),

        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          _drawerKey.currentState
              ?.openDrawer(); // it wil open drawer menu programaticaly
        },
      ),
      actions: appBarActions(),
      title: buildCircleImage(40),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      elevation: 5,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                gradient:buildLinearGradient(Colors.blueGrey)
              ),
              child: buildCircleImage(100)),
          ListTile(
            title: Text('Main Screen'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Second Page'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MyApp(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
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
            "Fethiye",
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
  ClipRRect buildCircleImage(double size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size,
            width: size,
            decoration:
                BoxDecoration(color: Colors.lightBlue, shape: BoxShape.circle),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(size),
            child: Image.asset(
              'assets/images/emre.png',
              height: size * 0.95,
              width: size * 0.95,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
