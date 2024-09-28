import 'package:flutter/material.dart';

Widget customTextfield(final txtController, final text, final obscureText) =>
    TextField(
      controller: txtController,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: text,
        contentPadding: EdgeInsets.all(20),
      ),
      onChanged: (value) {},
    );

Widget customElevetedbtn(final text, Function() onPressed) => SizedBox(
      height: 50, 
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFC8DD),
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            )),
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
              color: Color(0xFFFFC8DD),
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
