import 'package:flutter/material.dart';

class SortPage extends StatefulWidget {
  const SortPage({super.key});

  @override
  State<SortPage> createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> {
  // Default selected value
  String dropdownValue = 'Relevance';

  // List of sorting options
  final List<String> sortOptions = [
    'Relevance',
    'Last Activity',
    'Member Since',
    'Rate',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sort',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),

        // Rounded Dropdown for sorting options
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5), // Margin of 5
          padding: const EdgeInsets.symmetric(horizontal: 5), // Padding of 5
          decoration: BoxDecoration(
            color: Colors.pink[50], // Light pink background color
            borderRadius: BorderRadius.circular(10), // Rounded design
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              alignment: AlignmentDirectional.centerStart,
              value: dropdownValue,
              icon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Icon(Icons.arrow_drop_down), // Dropdown icon
              ),
              isExpanded: true, // Ensures the dropdown takes full width
              borderRadius: BorderRadius.circular(10), // Rounded dropdown menu
              items: sortOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  alignment: AlignmentDirectional.centerStart,
                  value: value,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(value),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },

              dropdownColor: Colors.pink[50],
              elevation: 8,
            ),
          ),
        ),
      ],
    );
  }
}
