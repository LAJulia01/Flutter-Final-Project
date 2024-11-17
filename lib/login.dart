import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  late String errormessage;
  late bool isError;

Future checkLogin(username, password) async{
  showDialog(
    context: context,
    useRootNavigator: false,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    )
  );
    try {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: username,
    password: password,
  );
  setState(() {
    isError = false;
    errormessage = "";
    Navigator.pop(context);
  });
} on FirebaseAuthException catch (e) {
  print(e);

  setState(() {
    isError = false;
    errormessage = e.message.toString();
    Navigator.pop(context);
  });
}

  }

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
                'SIGN IN',
                style: txtstyle,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: usernamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Username',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  checkLogin(
                    usernamecontroller.text,
                    passwordcontroller.text,
                  );
                },
                child: const Text('LOGIN'),
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


}
