import 'package:flutter/material.dart';
import 'package:nannycare/utils/styles/style/textstyle.dart';

class SpokenLanguage extends StatefulWidget {
  const SpokenLanguage({super.key});

  @override
  State<SpokenLanguage> createState() => _SpokenLanguageState();
}

class _SpokenLanguageState extends State<SpokenLanguage> {
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
        Text(
          'Spoken language',
          style: AppTextStyles.subHeader,
        ),
        const SizedBox(height: 10),

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
      ],
    );
  }
}
