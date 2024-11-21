import 'package:flutter/material.dart';

mixin Styles {
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
        fontFamily: 'poppins',
        letterSpacing: 2,
      );

  static textStyle(double size, final color, final fontWeight) => TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: 'poppins',
        color: color,
        decoration: TextDecoration.none,
      );

  static paddingStyle(double horizontal, double vertical) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}
