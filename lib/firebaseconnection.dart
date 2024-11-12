import 'package:flutter/material.dart';

class FireCon extends StatefulWidget {
  const FireCon({super.key});

  @override
  State<FireCon> createState() => _FireConState(
  );
}

class _FireConState extends State<FireCon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IT415-BSIT4D-Firebase Connection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('You successfully connected to Firebase'),
            Text('BSIT4D'),
          ],
        ),
      ),
    );
  }
}