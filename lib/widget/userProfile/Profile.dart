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
            radius: 150 / 2,
          ),
          Positioned(
            top: 110,
            left: 110,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 74, 192, 78),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
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
