import 'package:flutter/material.dart';
import 'package:nannycare/utils/styles/style/textstyle.dart';

class LanguagesContent extends StatefulWidget {
  const LanguagesContent({super.key});

  @override
  State<LanguagesContent> createState() => _LanguagesContentState();
}

class _LanguagesContentState extends State<LanguagesContent> {
  String dropdownValue = 'English';

  // for others options
  bool isOtherSelected = false;

  // List of sorting options
  final List<String> sortOptions = [
    'English',
    'Spanish',
    'Mandarin',
    'French',
    'Arabic',
    'German',
    'Portuguese',
    'Italian',
    'Hindi',
    'Japanese',
    'Russian',
    'Other (with an option for users to specify)',
  ];

  // Text controller for the Other option input
  final TextEditingController otherLanguageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          children: [
            Text(
              'Which language do you speak?',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Change to your preferred language',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),

        const SizedBox(
          height: 20,
        ),
        // Rounded Dropdown for sorting options
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.pink[50],
            borderRadius: BorderRadius.circular(30),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              alignment: AlignmentDirectional.centerStart,
              value: dropdownValue,
              style: DropdownTextStyles.dropdownValue,
              icon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Icon(Icons.arrow_drop_down),
              ),
              isExpanded: true,
              borderRadius: BorderRadius.circular(10),
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
                  isOtherSelected = dropdownValue ==
                      'Other (with an option for users to specify)';
                  // Clear the text field if not selected
                  if (!isOtherSelected) {
                    otherLanguageController.clear();
                  }
                });
              },
              dropdownColor: Colors.pink[50],
              elevation: 8,
            ),
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        // TextField for specifying other language
        if (isOtherSelected) ...[
          const SizedBox(height: 10),
          // Set desired height
          TextField(
            controller: otherLanguageController,
            decoration: InputDecoration(
              labelText: 'Please specify your language',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],

        const SizedBox(
          height: 20,
        ),
        //btn
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ), // Button padding
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
