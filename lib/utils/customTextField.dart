import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.obscureText,
    required this.controller,
    required this.hintText,
    required this.icon,
  });

  final bool obscureText;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  @override
  State<CustomTextField> createState() => CcustomTextFieldState();
}

class CcustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      
      child: TextField(
          obscureText: widget.obscureText,
          controller: widget.controller,
          decoration: InputDecoration(
              border: const OutlineInputBorder(
              ),
              hintText: widget.hintText,
              suffixIcon: Icon(
                widget.icon,
                size: 24,
              ))),
              
              
    );
  }
}
