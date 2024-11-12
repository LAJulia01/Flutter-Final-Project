import 'package:flutter/material.dart';
import 'package:nannycare/utils/styles/style/textstyle.dart';

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
        Text(
          'Number of Children',
          style: AppTextStyles.subHeader,
        ),
        const Text(
          "1 to 15+ children",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
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
                  activeTrackColor: Colors.pink, // Active track color
                  inactiveTrackColor:
                      Colors.pink.withOpacity(0.3), // Inactive track color
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
                _currentValue > 1 ? '${_currentValue.round()}' : '',
                style: AppTextStyles.subHeader,
              ),
            ),
          ],
        ),

        // Row(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //       child: Text(
        //         _currentValue == 15
        //             ? 'I Miss YOOOOOOOOOOOOOOOOOOU!' // Display "Thank you" when the value is 15
        //             : _currentValue > 1
        //                 ? '${_currentValue.round()}' // Display the rounded value for other numbers greater than 1
        //                 : '', // Display nothing if _currentValue is 1 or less
        //         style:
        //             const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }
}
