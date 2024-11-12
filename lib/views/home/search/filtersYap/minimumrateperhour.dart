import 'package:flutter/material.dart';
import 'package:nannycare/utils/styles/style/textstyle.dart';

class MinRateHour extends StatefulWidget {
  const MinRateHour({super.key});

  @override
  State<MinRateHour> createState() => _MinRateHourState();
}

class _MinRateHourState extends State<MinRateHour> {
  String _selectedCurrency = '₱'; // Default selected currency
  final TextEditingController _rateController = TextEditingController();
  bool _isDropdownOpen = false; // To track if the dropdown is active

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Minimum rate per hour',
          style: AppTextStyles.subHeader,
        ),
        const SizedBox(height: 10),

        // Circular container for the input area
        Container(
          decoration: BoxDecoration(
            color: Colors.pink[50], // Light pink background color
            borderRadius: BorderRadius.circular(30), // Rounded design
          ),
          padding: const EdgeInsets.fromLTRB(
              10, 5, 10, 5), // Padding inside the container
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Currency dropdown
              DropdownButton<String>(
                value: _selectedCurrency,
                style: DropdownTextStyles.dropdownValue,
                underline: const SizedBox(), // Hide the underline
                isExpanded: false,
                items: const [
                  DropdownMenuItem(
                    value: '₱',
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('₱'),
                  ),
                  DropdownMenuItem(
                      value: '\$',
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('\$')),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCurrency = newValue!;
                    _isDropdownOpen; // Close dropdown after selection
                  });
                },
                onTap: () {
                  setState(() {
                    _isDropdownOpen = true; // Set dropdown as open
                  });
                },
              ),
              const SizedBox(
                  width: 10), // Space between dropdown and text field

              // Text field for entering the rate
              SizedBox(
                width: 80, // Fixed width for the input field
                child: TextField(
                  controller: _rateController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Rate',
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 5), // Padding for the text field
                  ),
                ),
              ),

              const SizedBox(
                  width: 10), // Space between input field and 'hour' text

              // Text indicating "per hour"
              Text(
                '/hr',
                style: AppTextStyles.body,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
