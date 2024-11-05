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

  //Profile Tranasaction Notification
  static const buttonColor = Color(0xFFFFF1F6);
  static const iconColor = Color(0xFFF5A7A5);
  static const fontColor = Color(0xFFF5A7A5);
  static const switchColor = Color(0xFFF5A7A5);
  static const containerColor = Color(0xFFFFD9E6);
  static const referenceColor = Color(0xFFF5A7A5);
  static const leadingColor = Colors.black;
  static const reiewsColor = Color(0xFFF5A7A5);
  static const starColor = Color(0xFFE7BD8B);

  static headerTextStyle(double size) => TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      );

  static textStyle(double size, final color, final fontWeight) => TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none,
      );

  static paddingStyle(double horizontal, double vertical) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  /*--  ------------ Padding Styles --------------*/
  static const double defaultPadding = 16.0;
}
