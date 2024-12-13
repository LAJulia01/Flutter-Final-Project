import 'package:flutter/material.dart';
import 'package:nannycare/auth/views/model/user.dart';
import 'package:nannycare/views/Profile/Widget/BottomBar.dart';
import 'package:nannycare/views/Profile/Widget/InfoHeader.dart';
import 'package:nannycare/views/Profile/Widget/Profile.dart';
import 'package:nannycare/views/Profile/Widget/back_button.dart';
import 'package:nannycare/views/Profile/Widget/profile_page.dart';
// import 'package:nannycare/views/Profile/Model/userData.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:nannycare/views/Profile/userdataservice.dart';
// import 'UserDataService.dart'; // Your service to fetch user data

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserData? userData; // Store fetched user data
  bool isLoading = true; // To manage loading state

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Fetch user data when the page loads
  }

  // Method to load user data
  Future<void> _loadUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser; // Get the current user
      if (user != null) {
        // Fetch user data from Firestore
        UserDataService userDataService = UserDataService();
        UserData fetchedUserData = await userDataService.getUserData(user.uid);

        setState(() {
          userData = fetchedUserData;
          isLoading = false; // Set loading to false when data is fetched
        });
      } else {
        // Handle the case where the user is not logged in
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error loading user data: $e");
      setState(() {
        isLoading = false; // Set loading to false even in case of an error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if data is still loading
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Show loading indicator
        ),
      );
    }

    // If user data is loaded
    if (userData == null) {
      return const Scaffold(
        body: Center(
          child: Text("No user data available"), // If there's no user data
        ),
      );
    }

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
                  Profile(userData: userData!), // Pass the user data to the Profile widget
                  const SizedBox(
                    height: 20,
                  ),
                  InfoHeader(userData: userData!), // Pass the user data
                  const SizedBox(
                    height: 20,
                  ),
                  ProfilePage(userData: userData!), // Pass the user data
                ],
              ),
            ],
          ),
          const Positioned(
            child: CustomBackButton(
              margin: EdgeInsets.only(top: 40, left: 20),
            ),
          ),
        ],
      ),
    );
  }
}
