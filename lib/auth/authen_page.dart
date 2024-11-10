import 'package:flutter/material.dart';
import 'package:final_project/models/location/location_mapscreen.dart';

import 'package:final_project/utils/styles.dart';

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
              'Authentication',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Security Alert :',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              'Unrecognized Login Attempt',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We\'ve detected a login attempt from a device or location you haven\'t used before.',
              style: TextStyle(height: 1.4),
            ),
            SizedBox(height: 20),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GoogleMapsPage()));
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
