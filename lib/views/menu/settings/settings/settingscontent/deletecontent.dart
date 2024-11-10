import 'package:baby_sitter/utils/style/textstyle.dart';
import 'package:flutter/material.dart';

class DeleteAccountContent extends StatefulWidget {
  const DeleteAccountContent({super.key});

  @override
  State<DeleteAccountContent> createState() => _DeleteAccountContentState();
}

class _DeleteAccountContentState extends State<DeleteAccountContent> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;

  bool showOtherTextField =
      false; // To control the visibility of the text field
  TextEditingController otherController =
      TextEditingController(); // Controller for the text field

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // center the content
      crossAxisAlignment:
          CrossAxisAlignment.start, //but to put it in the left side
      children: [
        const SizedBox(
          height: 20,
        ),

        Row(
          children: [
            Checkbox(
              value: isChecked1,
              onChanged: (bool? value) {
                setState(() {
                  isChecked1 = value!;
                });
              },
              activeColor: const Color(0xFFF1F6F6),
              checkColor: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "I no longer need the service",
              style: SettingsContent.deleteacccheckbox,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Checkbox(
              value: isChecked2,
              onChanged: (bool? value) {
                setState(() {
                  isChecked2 = value!;
                });
              },
              activeColor: const Color(0xFFF1F6F6),
              checkColor: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "I didn't find a job",
              style: SettingsContent.deleteacccheckbox,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Checkbox(
              value: isChecked3,
              onChanged: (bool? value) {
                setState(() {
                  isChecked3 = value!;
                });
              },
              activeColor: const Color(0xFFF1F6F6),
              checkColor: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "App or Payment issue",
              style: SettingsContent.deleteacccheckbox,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Checkbox(
              value: isChecked4,
              onChanged: (bool? value) {
                setState(() {
                  isChecked4 = value!;
                });
              },
              activeColor: const Color(0xFFF1F6F6),
              checkColor: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Customer Care did not respond",
              style: SettingsContent.deleteacccheckbox,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Checkbox(
              value: isChecked5,
              onChanged: (bool? value) {
                setState(() {
                  isChecked5 = value!;
                  showOtherTextField = isChecked5; // Show text field if checked
                });
              },
              activeColor: const Color(0xFFF1F6F6),
              checkColor: Colors.black,
            ),
            const SizedBox(width: 10),
            Text(
              "Other",
              style: SettingsContent.deleteacccheckbox,
            ),
          ],
        ),
        // Conditionally display the text field
        if (showOtherTextField)
          Padding(
            padding: const EdgeInsets.all(
                10.0), // Add some padding for better alignment
            child: TextField(
              controller: otherController,
              decoration: const InputDecoration(
                hintText: "Explain futher",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'By deleting your account, you will cancel your pending applications',
                  style: SettingsContent.deleteacccheckbox,
                ),
              ),
            ),
          ],
        ),
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
