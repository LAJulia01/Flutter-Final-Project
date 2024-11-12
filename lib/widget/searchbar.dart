import 'package:flutter/material.dart';

class Searchbar1 extends StatefulWidget {
  const Searchbar1({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  @override
  State<Searchbar1> createState() => CSearchbarState();
}

class CSearchbarState extends State<Searchbar1> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: widget.hintText,
              prefixIcon: Icon(
                widget.icon,
                size: 24,
              ))),
    );
  }
}
