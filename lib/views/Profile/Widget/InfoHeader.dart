import 'package:flutter/material.dart';
import 'package:nannycare/views/Profile/Model/userData.dart';

import '../styles.dart';

class InfoHeader extends StatelessWidget {
  const InfoHeader({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          userData.userAccount.name,
          style: Styles.headerTextStyle(25),
        ),
        const SizedBox(
          height: 10,
        ),
        const Icon(
          Icons.place,
          size: 20,
          color: Styles.iconColor,
        ),
        Text(
          userData.userAccount.location,
          style: Styles.textStyle(
            15,
            Colors.black,
            FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Age:',
              style: Styles.headerTextStyle(15),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              userData.userAccount.age,
              style: Styles.textStyle(
                15,
                Colors.black,
                FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
