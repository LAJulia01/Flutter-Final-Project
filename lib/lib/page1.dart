import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/lib/model/employee.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireCon extends StatefulWidget {
  const FireCon({super.key});

  @override
  State<FireCon> createState() => _FireConState();
}

class _FireConState extends State<FireCon> {
  final user = FirebaseAuth.instance.currentUser!;

  var txtstyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );

  buildUserInfo(Employee employee) => Column(
        children: [
          const Text('from firestore:'),
          const SizedBox(height: 15),
          Text(employee.id, style: txtstyle),
          const SizedBox(height: 15),
          Text(employee.name, style: txtstyle),
        ],
      );

  getUserData(uid) {
    var collection = FirebaseFirestore.instance.collection('Employee');
    return StreamBuilder(
        stream: collection.doc(uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text('Error = ${snapshot.error}');
          }
          if (snapshot.hasData) {
            final data = snapshot.data!.data();
            final employee = Employee(
              id: data!['id'],
              name: data['name'],
              email: data['email'],
            );
            return buildUserInfo(employee);
          }
          return const Center(child: CircularProgressIndicator());
        },
    );
  }

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
            const SizedBox(height: 15),
            getUserData(user.uid),
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
