import 'package:flutter/material.dart';
import 'package:nannycare/utils/styles.dart';
import 'package:nannycare/views/home/mainpage.dart';

class AuthenPage extends StatelessWidget with GlobalStyles {
  AuthenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                color: GlobalStyles.deepRose,
                size: 80,
              ),
              const SizedBox(height: 10),
              const Text(
                'Authentication',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const AlertBox(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class AlertBox extends StatelessWidget {
  const AlertBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0), // Adjusted for smaller padding
      child: Container(
        padding: const EdgeInsets.all(20), // Reduced padding for responsiveness
        decoration: BoxDecoration(
          color: const Color(0xffFDE4E1),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Security Alert:',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
            const Text(
              'Unrecognized Login Attempt',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'We\'ve detected a login attempt from a device or location you haven\'t used before.',
              style: TextStyle(height: 1.4),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AlertButton(
                  label: "It's Not Me",
                  text: '',
                  onPressed: () {},
                ),
                AlertButton(
                  label: "It's Me",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  text: '',
                ),
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
  final Function() onPressed;
  final String text;

  const AlertButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF5A7A5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
