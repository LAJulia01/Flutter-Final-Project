import 'package:final_project/lib/page1.dart';
import 'package:final_project/lib/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticator extends StatefulWidget {
  const Authenticator({super.key});

  @override
  State<Authenticator> createState() => _AuthenticatorStateState();
}

class _AuthenticatorStateState extends State<Authenticator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            ); // Center
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong!'),
            ); // Center
          } else if (snapshot.hasData) {
            return const FireCon();
          } else {
            return const Login();
          }
        },
      ),
    );
  }


}
