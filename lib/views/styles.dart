import 'package:flutter/material.dart';

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


