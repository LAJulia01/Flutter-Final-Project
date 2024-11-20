import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 1, color: Colors.black),
        minimumSize: const Size.fromHeight(54),
        backgroundColor: const Color(0xFFF5A7A5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      child: Text(
        widget.text,
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins'),
      ),
    );
  }
}

Widget customBtn(final text, Function()? onPressed) => ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 1, color: Colors.black),
        elevation: 3,
        minimumSize: const Size.fromHeight(54),
        backgroundColor: const Color(0xFFF5A7A5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );

Widget footerTitle(Function() onTap, final txt1, final txt2) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          txt1,
          style: const TextStyle(fontSize: 15),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            txt2,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );

Widget txtBttn(final txt, final onPressed) => TextButton(
      onPressed: onPressed,
      child: Text(txt),
    );

