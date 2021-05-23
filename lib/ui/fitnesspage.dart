import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_examples/components/utilComponents.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double currentApbarRadius = 40; // App Bar bottomLeftCircleRadius

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // İlk yazılan altta kalır
      body: Stack(
        children: [
          // Body
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                // Sapce
                Container(
                  height: 80,
                ),
                // Body header
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mediterranean diet",
                        style: GoogleFonts.dancingScript(
                          fontSize: 25,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(primary: Colors.blueAccent),
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Details",
                              style: GoogleFonts.dancingScript(fontSize: 20),
                            ),
                            Icon(
                              Icons.arrow_right_alt_outlined,
                              color: Colors.black,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // first Card
                buildKcalCard(size),
                buildKcalCard(size),
                buildKcalCard(size),
              ],
            ),
          ),

          //Appbar
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn,
            height: size.height * 0.1,
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [buildBoxShadow()],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(currentApbarRadius))),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Text
                    Text(
                      "My Diary",
                      style: GoogleFonts.actor(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),

                    // Icon Button For Left
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.chevron_left,
                          ),
                        ),
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 15,
                        ),
                        Container(
                          width: 5,
                        ),
                        Text(
                          "15 May",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.chevron_right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildKcalCard(Size size) {
    return Container(
      margin: EdgeInsets.all(10),
                height: size.height * 0.4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(100),
                    ),
                    boxShadow: [buildBoxShadow()]),
                child: Column(
                  children: [
                    Flexible(
                      flex: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                              child: Column(
                            children: [
                              Flexible(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 2,
                                        decoration: BoxDecoration(
                                            gradient: buildLinearGradient(
                                                Colors.lightBlue)),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Eaten"),
                                          Image.network(
                                            'https://image.flaticon.com/icons/png/128/4310/4310157.png',
                                            width: 50,
                                            fit: BoxFit.fitWidth,
                                          )
                                        ],
                                      ),
                                      Text(
                                        "1127",
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "kcal",
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.grey),
                                      )
                                    ],
                                  )),
                              Flexible(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 2,
                                        decoration: BoxDecoration(
                                            gradient: buildLinearGradient(
                                                Colors.red)),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Burned"),
                                          Image.network(
                                            'https://image.flaticon.com/icons/png/512/3160/3160163.png',
                                            width: 50,
                                            fit: BoxFit.fitWidth,
                                          )
                                        ],
                                      ),
                                      Text(
                                        "102",
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "kcal",
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.grey),
                                      )
                                    ],
                                  )),
                            ],
                          )),
                          Flexible(
                            flex: 1,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue
                                    ),
                                  ),
                                  Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: size.width*0.72,
                        decoration: BoxDecoration(
                            gradient: buildLinearGradient(Colors.blue)),
                      ),
                    ),
                    Flexible(
                        flex: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Carbs",
                                  style: GoogleFonts.lato(
                                    fontSize: 22,
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  child: LinearProgressIndicator(
                                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                                    value: 50,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text("12g left")
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Protein",
                                  style: GoogleFonts.lato(
                                    fontSize: 22,
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  child: LinearProgressIndicator(
                                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                                    value: 50,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text("30g left")
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Fat",
                                  style: GoogleFonts.lato(
                                    fontSize: 22,
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  child: LinearProgressIndicator(
                                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow),
                                    value: 50,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text("10g left")
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              );
  }
}
