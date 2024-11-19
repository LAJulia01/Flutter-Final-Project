import 'package:flutter/material.dart';
import 'package:nannycare/views/Profile/Model/userData.dart';

import '../styles.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Styles.fontColor, // border color
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
                  color: Styles.buttonColor,
                  shape: BoxShape.circle,
                ),
                width: 20,
                height: 20,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Styles.iconColor,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
