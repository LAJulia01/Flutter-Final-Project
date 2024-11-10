import 'package:baby_sitter/utils/styles1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

/// A customizable toggle switch widget
Widget toggleSwitch({
  required String title,
  required bool switchValue,
  required ValueChanged<bool> onToggle, // Callback to manage state externally
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyText, // Custom text style
        ),
        FlutterSwitch(
          value: switchValue,
          onToggle: onToggle, // Use external state management callback
          activeColor: const Color(0xFFF5A7A5), // Active color
          inactiveColor: Colors.black26, // Inactive color
          width: 50.0, // Switch width
          height: 25.0, // Switch height
          toggleSize: 20.0, // Toggle thumb size
          borderRadius: 20.0, // Rounded corners
          padding: 4.0, // Inner padding
        ),
      ],
    ),
  );
}
