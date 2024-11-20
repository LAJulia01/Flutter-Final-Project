import 'package:flutter/material.dart';

class AlertDialog1 extends StatefulWidget {
  const AlertDialog1({super.key});

  @override
  State<AlertDialog1> createState() => AlertDialog1State();
}

class AlertDialog1State extends State<AlertDialog1> {
  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                children: [
                  Image.asset('assets/gratsimage.png'),
                  Text('Successfully Submitted!'),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.black),
                  minimumSize: const Size.fromHeight(54),
                  backgroundColor: const Color(0xFFF5A7A5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                child: Text('DONE'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _showDialog,
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 1, color: Colors.black),
        minimumSize: const Size.fromHeight(54),
        backgroundColor: const Color(0xFFF5A7A5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      child: Text(
        'Submit',
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins'),
      ),
    );
  }
}
