import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final String label;
  final Color activeColor;
  final Color checkColor;
  final TextStyle? labelStyle;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.label,
    this.activeColor = const Color(0xFFF1F6F6),
    this.checkColor = Colors.black,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          activeColor: activeColor,
          checkColor: checkColor,
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: labelStyle,
        ),
      ],
    );
  }
}
