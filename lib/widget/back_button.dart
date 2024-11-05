import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/styles.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.margin});
  final dynamic margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Align(
        alignment: Alignment.topLeft,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            alignment: Alignment.centerRight,
            minimumSize: const Size(60, 60),
            iconColor: GlobalStyles.iconColor,
            backgroundColor: GlobalStyles.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () {},
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
