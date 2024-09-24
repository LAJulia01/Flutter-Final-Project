import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/model/userdata.dart';

class InfoHeader extends StatelessWidget {
  const InfoHeader({
    super.key,
    required this.userData,
  });

  final UserData userData;

  final followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text('Followers'),
                const SizedBox(height: 4),
                Text(
                  userData.myUserAccount.numFollowers,
                  style: followTxtStyle,
                ),
              ],
            ),
            Column(
              children: [
                const Text('Posts'),
                const SizedBox(height: 4),
                Text(
                  userData.myUserAccount.numPosts,
                  style: followTxtStyle,
                ),
              ],
            ),
            Column(
              children: [
                const Text('Following'),
                const SizedBox(height: 4),
                Text(
                  userData.myUserAccount.numFollowing,
                  style: followTxtStyle,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
