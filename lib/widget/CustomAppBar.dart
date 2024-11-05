import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/styles.dart';
import 'package:module2_4_lab_exercise/widget/back_button.dart';

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
            style: GlobalStyles.textStyle(
                25, GlobalStyles.leadingColor, FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
