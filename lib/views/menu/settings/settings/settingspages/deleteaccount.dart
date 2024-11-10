import 'package:final_project/utils/styles/styles1.dart';
import 'package:final_project/views/menu/settings/settings/settingspages/widgets/checkbox_delete_reason.dart';
import 'package:final_project/views/menu/widgets/settings_appbar_widget.dart';
import 'package:flutter/material.dart';

class DeleteAccoung extends StatefulWidget {
  const DeleteAccoung({super.key});

  @override
  State<DeleteAccoung> createState() => _DeleteAccoungState();
}

class _DeleteAccoungState extends State<DeleteAccoung> {
  bool noNeedServices = false;
  bool didntFindJob = false;
  bool paymentIssue = false;
  bool customCare = false;
  bool others = false;

  bool showOtherTextField =
      false; // To control the visibility of the text field
  TextEditingController otherController =
      TextEditingController(); // Controller for the text field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(
        title: 'Delete Account',
        context: context,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reason for deleting', style: AppTextStyles.header),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      'We value your opinion! By sharing your feedback, you\'re helping us improve our service and provide an even better experience for you. So don\'t hesitate to let us know what you think!',
                      style: AppTextStyles.bodyText),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomCheckbox(
              isChecked: noNeedServices,
              onChanged: (bool? value) {
                setState(() {
                  noNeedServices = value!;
                });
              },
              label: "I no longer need the service",
              labelStyle: AppTextStyles.bodyText, // Adjust as needed
            ),
            CustomCheckbox(
              isChecked: didntFindJob,
              onChanged: (bool? value) {
                setState(() {
                  didntFindJob = value!;
                });
              },
              label: "I didn't find a job.",
              labelStyle: AppTextStyles.bodyText, // Adjust as needed
            ),
            CustomCheckbox(
              isChecked: paymentIssue,
              onChanged: (bool? value) {
                setState(() {
                  paymentIssue = value!;
                });
              },
              label: "App or payment issue.",
              labelStyle: AppTextStyles.bodyText, // Adjust as needed
            ),
            CustomCheckbox(
              isChecked: customCare,
              onChanged: (bool? value) {
                setState(() {
                  customCare = value!;
                });
              },
              label: "Customer care did not respond.",
              labelStyle: AppTextStyles.bodyText, // Adjust as needed
            ),
            Row(
              children: [
                Checkbox(
                  value: others,
                  onChanged: (bool? value) {
                    setState(() {
                      others = value!;
                      showOtherTextField = others; // Show text field if checked
                    });
                  },
                  activeColor: const Color(0xFFF1F6F6),
                  checkColor: Colors.black,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Other",
                  style: AppTextStyles.bodyText,
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
                    border: OutlineInputBorder(),
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
                    child: const Text(
                      'By deleting your account, you will cancel your pending applications',
                      style: AppTextStyles.bodyText,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5A7A5),
                  padding: const EdgeInsets.all(20), // Button padding
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
        ),
      ),
    );
  }
}
