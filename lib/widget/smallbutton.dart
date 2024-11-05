import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/styles.dart';

class Smallbutton extends StatefulWidget {
  const Smallbutton({super.key, required this.text, required this.color, required this.onPressed});

  final String text;
  final Color color;
  final Function() onPressed;

  @override
  State<Smallbutton> createState() => _ButtonState();
}

class _ButtonState extends State<Smallbutton> with GlobalStyles {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 25,
            )
        ]
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: GlobalStyles.buttonColorsmall,
          minimumSize: const Size(139, 46)
        ),
        child: Text(widget.text),
      ),
    );
  }
}