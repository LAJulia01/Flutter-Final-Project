import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/styles.dart';

class ForgetPassword extends StatelessWidget with GlobalStyles {
  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              color: GlobalStyles.deepRose,
              size: 80,
            ),
            SizedBox(height: 10),
            Text(
              'Forgot Password',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            AlertBox(),
            SizedBox(height: 20),
            Icon(
              Icons.keyboard_arrow_left,
              size: 30,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class AlertBox extends StatelessWidget {
  const AlertBox({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Color(0xffFDE4E1),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Please enter your email address to reset'),
            const SizedBox(height: 5),
            Text('your password.'),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Email address:'),
              ],
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 500,
              child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder())),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AlertButton(text: 'Send', label: 'Send', onPressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AlertButton extends StatelessWidget {
  final String label;

  const AlertButton(
      {super.key,
      required this.text,
      required this.label,
      required this.onPressed});

  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFF5A7A5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: Colors.black), // Set the text color to black
      ),
    );
  }
}
