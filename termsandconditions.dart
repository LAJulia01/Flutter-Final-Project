import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  @override
  _TermsAndConditionsScreenState createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms and Conditions',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "poppins"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  '''
Welcome to Nanny Care!               
These Terms and Conditions outline the rules for using the Nanny Care mobile application and the services offered through it. By accessing or using the App, you agree to follow and be bound by these Terms. If you do not agree to them, please refrain from using the App.


By downloading, accessing, or using the App, you agree to abide by these Terms. You also consent to our Privacy Policy, which is included as part of these Terms. To use the App, you must be at least 18 years old or meet the legal age requirement in your area.


User Conduct:
- Use the App in a lawful and respectful manner.
- Do not use the App for illegal purposes.
- Do not violate any laws or regulations applicable to your use of the App.
- Do not engage in any fraudulent, abusive, or harmful behavior.

Nanny Care reserves the right to suspend or terminate your account at its discretion if you violate these Terms or engage in harmful behavior.If you have any questions, please contact us at: [Insert Contact Information].''',
                  style: TextStyle(fontSize: 12, fontFamily: "poppins"),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _isAgreed,
                  onChanged: (bool? value) {
                    setState(() {
                      _isAgreed = value ?? false;
                    });
                    // Handle the checkbox state change
                  },
                  activeColor: const Color.fromARGB(
                      255, 207, 72, 117), // Color when checkbox is checked
                  checkColor: Colors.white, // Color of the checkmark
                ),
                Expanded(
                  child: Text(
                    'I agree to the Terms and Conditions',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isAgreed
                  ? () {
                      // Action when "I Agree" button is pressed
                      // Navigate to another screen or perform other actions
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 232, 113, 153),
                disabledBackgroundColor: Colors.white,
              ),
              child: const Text(
                'I Agree',
                style: TextStyle(color: Color.fromARGB(255, 226, 226, 226)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
