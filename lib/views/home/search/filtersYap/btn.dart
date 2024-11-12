import 'package:flutter/material.dart';

class Btn extends StatefulWidget {
  final String label; // Btn label
  final Widget destination; // Page to navigate to
  final Color backgroundColor; // btn bg color
  final Color textColor; // btn text color

  const Btn(
      {super.key,
      required this.label,
      required this.destination,
      required this.backgroundColor,
      required this.textColor});

  @override
  State<Btn> createState() => _BtnState();
}

class _BtnState extends State<Btn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ), // Button padding
      ),
      onPressed: () {
        // Navigate to the destination page when the button is pressed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.destination),
        );
      },
      child: Text(
        widget.label,
        style: TextStyle(color: widget.textColor),
      ),
    );
  }
}
