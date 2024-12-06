import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.obscureText,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.labelText,
  });

  final bool obscureText;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final String labelText;

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: TextFormField(
        obscureText: widget.obscureText,
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromARGB(255, 255, 200, 210),
          )),
          border: const OutlineInputBorder(),
          hintText: widget.hintText,
        ),
        validator: (value) {
          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!);

          if (value.isEmpty) {
            return "Enter email";
          }
          if (!emailValid) {
            return "Enter Valid Email";
          }
          return null;
        },
      ),
    );
  }
}

Widget cstmTextfield(final hintText) => TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(255, 255, 200, 210),
        )),
        hintText: hintText,
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(),
      ),
    );
