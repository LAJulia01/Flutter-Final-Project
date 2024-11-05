import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/models/userData.dart';
import 'package:module2_4_lab_exercise/styles.dart';

class InfoHeader extends StatelessWidget {
  const InfoHeader({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          userData.userAccount.name,
          style: GlobalStyles.headerTextStyle(25),
        ),
        const SizedBox(
          height: 10,
        ),
        const Icon(
          Icons.place,
          size: 20,
          color: GlobalStyles.iconColor,
        ),
        Text(
          userData.userAccount.location,
          style: GlobalStyles.textStyle(
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
              style: GlobalStyles.headerTextStyle(15),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              userData.userAccount.age,
              style: GlobalStyles.textStyle(
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
