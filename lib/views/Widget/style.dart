import 'package:flutter/material.dart';

Widget customTextfield(final txtController, final text) => TextField(
      controller: txtController,
      decoration: InputDecoration(
        hintText: text,
        contentPadding: EdgeInsets.all(20),
      ),
      onChanged: (value) {},
    );

Widget customElevetedbtn(final text) => SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
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
