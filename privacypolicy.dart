import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to Nanny Care',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "poppins"),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                '',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "poppins"),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this policy carefully. If you do not agree with the terms of this policy, please do not access the app.',
              style:
                  TextStyle(fontSize: 12, height: 1.5, fontFamily: "poppins"),
            ),
            const SizedBox(height: 24),
            const Text(
              'Information We Collect',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "poppins"),
            ),
            const SizedBox(height: 8),
            const Text(
              'When you use our app, we may collect the following types of information:',
              style:
                  TextStyle(fontSize: 12, height: 1.5, fontFamily: "poppins"),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Personal Information: This may include your name, email address, phone number, and other personal details when you register or contact us.\n\n'
              '• Usage Data: We may collect information about how you use the app, including pages viewed, time spent on pages, and navigation behavior.\n\n'
              '• Device Information: We collect information about your mobile device, such as its model, operating system, and unique device identifiers.',
              style:
                  TextStyle(fontSize: 12, height: 1.5, fontFamily: "poppins"),
            ),
            const SizedBox(height: 24),
            const Text(
              'How We Use Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'The information we collect is used for the following purposes:',
              style:
                  TextStyle(fontSize: 12, height: 1.5, fontFamily: "poppins"),
            ),
            const SizedBox(height: 8),
            const Text(
              '• To provide and improve our services: We use the collected data to deliver, maintain, and improve the performance of the app.\n\n'
              '• To communicate with you: Your contact information may be used to send notifications, updates, or respond to inquiries.\n\n'
              '• To ensure security: We may use your data to detect and prevent fraudulent activities or abuse of the app.',
              style:
                  TextStyle(fontSize: 12, height: 1.5, fontFamily: "poppins"),
            ),
            const Spacer(),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                  activeColor: const Color.fromARGB(
                      255, 207, 72, 117), // Color when checkbox is checked
                  checkColor: Colors.white, //
                ),
                const Expanded(
                  child: Text(
                    'I agree to the Privacy Policy',
                    style: TextStyle(fontSize: 12, fontFamily: "poppins"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                onPressed: isChecked
                    ? () {
                        // Add your action here, like navigating to the next screen
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 196, 117, 143),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'I Agree',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
