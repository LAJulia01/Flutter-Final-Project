import 'package:flutter/material.dart';

// kenneth
mixin GlobalStyles {
  final textStyleHEADER = const TextStyle(
    fontFamily: 'poppins',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color(0xffF5A7A5),
  );

  final textStyleSUBHEADER = const TextStyle(
    fontFamily: 'poppins',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Color(0xffD0E4ED),
  );

  final textStyleBODYTEXT = const TextStyle(
    fontFamily: 'poppins',
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Color(0xffF5CF9E),
  );

  final textStyleOptioncolor = const TextStyle(
    fontFamily: 'poppins',
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Color(0xffF3F6A9),
  );

  static const primaryColor = Color.fromARGB(255, 255, 255, 1);
  static const secondaryColor = Color.fromARGB(255, 255, 255, 1);

  var buttonColorsmall;

  var deepRose;
}
