import 'package:flutter/material.dart';

// Circle button builder method
Widget circleButton({
  required BuildContext context, // Add BuildContext as a required parameter
  required IconData icon,
  required Widget targetPage, // Add a required parameter for the target page
}) {
  return GestureDetector(
    onTap: () {
      // Navigate to the target page when the button is pressed
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => targetPage),
      );
    },
    child: Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: const Color(0xFFF5A7A5),
        size: 24,
      ),
    ),
  );
}
