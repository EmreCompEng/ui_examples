import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({Key? key}) : super(key: key);

  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {

  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  double _width =  300;
  double _height = 300;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(100);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedCard(),
      ),

    );
  }
}

class AnimatedCard extends StatefulWidget {
  const AnimatedCard({Key? key,}):super(key: key);
  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {

  double _height=300;
  double _widht=0;
  bool isClicked=false;

  @override
  Widget build(BuildContext context) {

    //_height=MediaQuery.of(context).size.height*0.4;
    _widht=MediaQuery.of(context).size.width*0.9;

    return GestureDetector(
      onTap: (){
        setState(() {
          if(isClicked){
            _height/=2;
            isClicked=false;
          }
          else{
            _height*=2;
            isClicked=true;
          }

        });
      },
      child: AnimatedContainer(
        // Use the properties stored in the State class.
        width: _widht,
        height: _height,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        // Define how long the animation should take.
        duration: Duration(seconds: 1),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.easeOutQuart,
      ),
    );
  }
}



