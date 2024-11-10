import 'package:flutter/material.dart';
import 'package:baby_sitter/utils/styles1.dart';

Widget navigationButton({
  required IconData icon,
  required String label,
  Widget? page, // Nullable page
  BuildContext? context, // Nullable context
}) {
  return GestureDetector(
    onTap: () {
      // Check if both context and page are not null before navigating
      if (context != null && page != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF5A7A5),
        borderRadius: BorderRadius.circular(16.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.2),
        //     blurRadius: 8.0,
        //     offset: const Offset(2, 4),
        //   ),
        // ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.white),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.bodyText.copyWith(color: Colors.white),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 24,
          ),
        ],
      ),
    ),
  );
}
