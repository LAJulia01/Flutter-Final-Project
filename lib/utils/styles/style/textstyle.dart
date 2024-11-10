import 'package:flutter/material.dart';

// yap
class AppTextStyles {
  // fontFamily: , kaw nay bahala sa fonts gaw
  static TextStyle header = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle subHeader = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static TextStyle body = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
  );

  static var bodyText;
}

// Sort
class DropdownTextStyles {
  static TextStyle dropdownValue = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
  );

  static TextStyle dropdownItem = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
  );
}

// for settings content styles
class SettingsContent {
  // fontFamily: , kaw nay bahala sa fonts gaw
  static TextStyle appbar = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle subHeader = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );

  static TextStyle description = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );

  static TextStyle deleteacccheckbox = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );
}
