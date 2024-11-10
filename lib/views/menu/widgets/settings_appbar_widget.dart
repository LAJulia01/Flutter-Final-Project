import 'package:baby_sitter/utils/styles1.dart';
import 'package:flutter/material.dart';

/// A customizable Settings AppBar widget
AppBar settingsAppBar({
  required String title,
  BuildContext? context, // Optional context
}) {
  return AppBar(
    backgroundColor: const Color(0xFFF5A7A5), // Custom background color
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_rounded,
        size: 24,
      ),
      onPressed: () {
        if (context != null) {
          Navigator.pop(context); // Navigate back if context is provided
        }
      },
    ),
    title: Text(
      title,
      style: AppTextStyles.subHeader, // Custom text style from styles1.dart
    ),
  );
}
