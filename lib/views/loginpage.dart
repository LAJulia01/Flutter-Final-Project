import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/views/Widget/style.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 52, vertical: 47),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                child: const CircleAvatar(
                  child: Text('Logo'),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              customTextfield(emailController, 'Email'),
              const SizedBox(
                height: 25,
              ),
              customTextfield(passwordController, 'Password'),
              const SizedBox(
                height: 40,
              ),
              customElevetedbtn('LOGIN'),
              const SizedBox(
                height: 150,
              ),
              const Text(
                'Login using',
                style: TextStyle(
                  color: Color.fromARGB(200, 0, 0, 0),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          )),
    );
  }
}
