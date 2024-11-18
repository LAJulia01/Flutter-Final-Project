import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/lib/authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_project/lib/model/employee.dart';
import 'package:final_project/lib/page1.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  late String errormessage;
  late bool isError;

  @override
  void initState() {
    errormessage = "This is an error";
    isError = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'REGISTER',
                style: txtstyle,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Email Address',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  registerUser();
                },
                child: const Text('REGISTER'),
              ),
              const SizedBox(height: 15),
              (isError)
                  ? Text(
                      errormessage,
                      style: errortxtstyle,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  var errortxtstyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.red,
    letterSpacing: 1,
    fontSize: 18,
  );
  var txtstyle = const TextStyle(
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    fontSize: 38,
  );

  Future createUser() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docUser = FirebaseFirestore.instance.collection('Employee').doc(userid);

    final employee = Employee(
      id: userid, 
      name: namecontroller.text, 
      email: emailcontroller.text,
      ); 

    final json = employee.toJson();
    await docUser.set(json);

    goToAuthenticator();
  }

  Future registerUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
      createUser();
      setState(() {
        isError = false;
        errormessage = "";
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      setState(() {
        isError = true;
        errormessage = e.message.toString();
      });
    }
  }

  goToAuthenticator() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Authenticator(),
      ),
    );
  }
}
