import 'package:flutter/material.dart';


// Return Linear gradient Colors
LinearGradient buildLinearGradient(MaterialColor color) {
  return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [color.shade900, color.shade300]);
}