import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.obscureText,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.validator,
  });

  final bool obscureText;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validator; // Add validator here

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        validator: widget.validator, // Use validator here
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: widget.hintText,
          suffixIcon: Icon(
            widget.icon,
            size: 24,
          ),
        ),
      ),
    );
  }
}
