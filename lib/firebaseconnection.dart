import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireCon extends StatefulWidget {
  const FireCon({super.key});

  @override
  State<FireCon> createState() => _FireConState(
  );
}

class _FireConState extends State<FireCon> {
  final user = FirebaseAuth.instance.currentUser!;

  var txtstyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IT415-BSIT4D-Firebase Connection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You successfully connected to Firebase'),
            const SizedBox(height: 15),
            const Text('signed as: '),
            Text(
              user.email!,
              style: txtstyle,
              ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('SIGN OUT'),
              ),
          ],
        ),
      ),
    );
  }
}