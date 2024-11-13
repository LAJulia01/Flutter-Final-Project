import 'package:flutter/material.dart';
import 'package:nannycare/views/menu/widgets/settings_appbar_widget.dart';

import '../../../../../utils/styles/styles1.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
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
    'Others',
  ];

  // Text controller for the Other option input
  final TextEditingController otherLanguageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: settingsAppBar(
        title: 'Settings',
        context: context, 
        style: TextStyle(), 
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Change to your preferred language: ',
            ),

            // Rounded Dropdown for sorting options
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5A7A5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: AlignmentDirectional.centerStart,
                  value: dropdownValue,
                  style: AppTextStyles.bodyText,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                  ),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(8),
                  items:
                      sortOptions.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.centerStart,
                      value: value,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text(
                          value,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      isOtherSelected = dropdownValue == 'Others';
                      // Clear the text field if not selected
                      if (!isOtherSelected) {
                        otherLanguageController.clear();
                      }
                    });
                  },
                  dropdownColor: const Color(0xFFF5A7A5),
                ),
              ),
            ),

            if (isOtherSelected) ...[
              const SizedBox(height: 10),
              // Set desired height
              TextField(
                controller: otherLanguageController,
                decoration: InputDecoration(
                  labelText: 'Please specify your language',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
