import 'package:flutter/material.dart';

import '../styles.dart';

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
            iconColor: Styles.iconColor,
            backgroundColor: Styles.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
