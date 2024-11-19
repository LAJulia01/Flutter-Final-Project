import 'package:flutter/material.dart';
import 'package:nannycare/views/Profile/Widget/back_button.dart';

import '../styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomBackButton(
          margin: EdgeInsets.only(top: 20, left: 20),
        ),
        const SizedBox(
          width: 20,
        ),
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
