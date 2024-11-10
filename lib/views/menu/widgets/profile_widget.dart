import 'package:flutter/material.dart';
import 'package:final_project/utils/styles/styles1.dart'; // Ensure AppTextStyles is available.

Widget myProfile() {
  return Center(
    child: Column(
      children: [
        Text(
          'My Profile',
          style: AppTextStyles.header.copyWith(color: const Color(0xFFF5A7A5)),
        ),
        const SizedBox(height: 16),
        const CircleAvatar(
          radius: 50,
          foregroundImage: AssetImage('assets/images/img.jpg'),
        ),
        const SizedBox(height: 12),
        Text(
          'Eba',
          style:
              AppTextStyles.subHeader.copyWith(color: const Color(0xFFF5A7A5)),
        ),
        const SizedBox(height: 10),
        const Text('dnsc@dnsc.edu.ph', style: AppTextStyles.bodyText),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on_rounded,
                size: 24, color: Color.fromARGB(255, 177, 177, 177)),
            const SizedBox(width: 10),
            Text(
              'Panabo, Davao',
              style: AppTextStyles.bodyText.copyWith(
                color: const Color.fromARGB(255, 177, 177, 177),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
