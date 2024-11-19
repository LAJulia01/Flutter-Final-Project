import 'package:flutter/material.dart';

import '../styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: Styles.textStyle(25, Styles.leadingColor, FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
