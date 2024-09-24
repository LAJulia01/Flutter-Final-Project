import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/model/userdata.dart';
import 'package:module2_4_lab_exercise/views/friendlist.dart';
import 'package:module2_4_lab_exercise/views/infoheader.dart';
import 'package:module2_4_lab_exercise/views/mainheader.dart';
import 'package:module2_4_lab_exercise/views/postslist.dart';

class Socialmedia extends StatefulWidget {
  const Socialmedia({super.key});

  @override
  State<Socialmedia> createState() => _SocialmediaState();
}

class _SocialmediaState extends State<Socialmedia> {
  UserData userData = UserData();

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Mainheader(userData: userData),
          InfoHeader(userData: userData),
          Friendlist(userData: userData),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text(
                  'Post',
                  style: followTxtStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          PostsList(userData: userData),
        ],
      ),
    );
  }
}
