// flutter
import 'package:flutter/material.dart';

mixin GlobalStyles {
  /*-------------- Text Styles --------------*/
  final TextStyle primaryText = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    fontFamily: 'poppins',
  );
  final TextStyle semiPrimaryText = const TextStyle(
    fontSize: 18,
    fontFamily: 'poppins',
  );

  final TextStyle secondaryText = const TextStyle(
    fontSize: 16,
    fontFamily: 'poppins',
  );

  final TextStyle semiSecondaryText = const TextStyle(
    fontSize: 15,
    fontFamily: 'poppins',
  );

  final TextStyle regularText = const TextStyle(
    fontSize: 14,
    fontFamily: 'poppins',
  );
  final TextStyle semiRegularText = const TextStyle(
    fontSize: 13,
    fontFamily: 'poppins',
  );
  final TextStyle bodyText = const TextStyle(
    fontSize: 12,
    fontFamily: 'poppins',
  );
  final TextStyle semiBodyText = const TextStyle(
    fontSize: 11,
    fontFamily: 'poppins',
  );

  static const dynamic iconSize = 24;

  /*-------------- Color Styles --------------*/
  static const Color blushPink = Color(0xffFFC1CC);
  static const Color softGray = Color(0xffD3D3D3);
  static const Color mustardYellow = Color(0xffF4CAC3);
  static const Color deepRose = Color(0xffE28595);
  static const Color palePeach = Color(0xffFFDAB9);

  static const Color buttonColorbig = Color(0xffFFEFED);
  static const Color buttonColorsmall = Color(0xffF5A7A5);

  /*--  ------------ Padding Styles --------------*/
  static const double defaultPadding = 16.0;
}

mixin Styles {
  final standardColor = Colors.purple;
  final horizontalMargin = const EdgeInsets.symmetric(vertical: 10);
  final buttonMargin = const EdgeInsets.symmetric(vertical: 5, horizontal: 5);
  final headerText = const TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );

  fieldStyle(String hintText_, String labelText_) => InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText_,
        labelText: labelText_,
      ); // InputDecoration
  btnStyle(btnColor_) => ElevatedButton.styleFrom(
        backgroundColor: btnColor_,
        minimumSize: const Size.fromHeight(50),
      );
}
