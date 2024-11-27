import 'package:flutter/material.dart';
import 'package:nannycare/auth/widgets/option_page.dart';
import 'package:nannycare/views/home/mainpage.dart';

class Choosing extends StatefulWidget {
  const Choosing({super.key});

  @override
  State<Choosing> createState() => _ChoosingState();
}

class _ChoosingState extends State<Choosing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 238, 238),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset('assets/NANNY’S CARE (4).png'),
            SizedBox(
              height: 60,
            ),
            CustomButton(
                text: 'Parent',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MainPage()));
                }),
            SizedBox(
              height: 25,
            ),
            CustomButton(
                text: 'Babysitter ',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MainPage()));
                }),
          ],
        ),
      ),
    );
  }
}
