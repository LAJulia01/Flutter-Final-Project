import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/models/userData.dart';
import 'package:module2_4_lab_exercise/widget/back_button.dart';
import 'package:module2_4_lab_exercise/widget/userProfile/BottomBar.dart';
import 'package:module2_4_lab_exercise/widget/userProfile/InfoHeader.dart';
import 'package:module2_4_lab_exercise/widget/userProfile/Profile.dart';
import 'package:module2_4_lab_exercise/widget/userProfile/profile_page.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserData userData = UserData();

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: const BottomBar(),
        body: Stack(
          children: [
            ListView(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Profile(userData: userData),
                    const SizedBox(
                      height: 20,
                    ),
                    InfoHeader(userData: userData),
                    const SizedBox(
                      height: 20,
                    ),
                    ProfilePage(userData: userData)
                  ],
                )
              ],
            ),
            const Positioned(
              child: CustomBackButton(
                margin: EdgeInsets.only(top: 40, left: 20),
              ),
            ),
          ],
        ));
  }
}
