import 'package:flutter/material.dart';


// Return Linear gradient Colors
LinearGradient buildLinearGradient(MaterialColor color) {
  return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [color.shade900, color.shade300]);
}



// Circle image
ClipRRect buildCircleImage(double size,String imagePath) {
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
            imagePath,
            height: size * 0.95,
            width: size * 0.95,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}


// BoxShadows
BoxShadow buildBoxShadow() {
  return BoxShadow(
    color: Colors.grey,
    offset: Offset(0.0, 1.0), //(x,y)
    blurRadius: 6.0,
  );
}










