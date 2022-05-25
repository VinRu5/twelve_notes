import 'package:flutter/material.dart';

class ColorsTwelve {
  //colors
  static const Color orangeRed = Color(0xFFF54F38);
  static const Color orange = Color(0xFFF58638);
  // gradient
  static const LinearGradient orangeGradient = LinearGradient(
    colors: [
      orangeRed,
      orange,
    ],
    begin: FractionalOffset(0.0, 0.0),
    end: FractionalOffset(1.0, 2.0),
  );
}
