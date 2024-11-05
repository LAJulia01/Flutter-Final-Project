import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/models/userData.dart';
import 'package:module2_4_lab_exercise/styles.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: GlobalStyles.fontColor, // border color
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(userData.userAccount.img),
            radius: 180 / 2,
          ),
          Positioned(
            top: 130,
            left: 130,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 74, 192, 78),
                shape: BoxShape.circle,
              ),
              width: 10,
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}
