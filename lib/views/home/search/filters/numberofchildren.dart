import 'package:flutter/material.dart';

class NumberOfChildren extends StatefulWidget {
  const NumberOfChildren({super.key});

  @override
  State<NumberOfChildren> createState() => _NumberOfChildrenState();
}

class _NumberOfChildrenState extends State<NumberOfChildren> {
  double _currentValue = 1; // Default value is 1

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Number of Children',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),

        // Draggable counter using a Slider from 1 to 15 with responsive width
        Row(
          children: [
            // Flexible widget to make the slider responsive to available width
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 14.0, // Thicker track height
                  thumbShape: SliderComponentShape.noThumb,
                ),
                child: Slider(
                  value: _currentValue,
                  min: 1,
                  max: 15,
                  label: _currentValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentValue = value;
                    });
                  },
                ),
              ),
            ),

            // Display the selected value
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '${_currentValue.round()}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
