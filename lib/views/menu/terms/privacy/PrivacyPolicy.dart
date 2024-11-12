// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nannycare/utils/styles.dart';
import 'package:nannycare/views/menu/widgets/settings_appbar_widget.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(title: 'Privacy Policy', context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Welcome to Nanny Care!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this policy carefully. If you do not agree with the terms of this policy, please do not access the app.',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 20),
                Text(
                  'Information We Collect',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'When you use our app, we may collect the following types of information:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                _buildBulletText(
                  'Personal Information: This may include your name, email address, phone number, and other personal details when you register or contact us.',
                ),
                _buildBulletText(
                  'Usage Data: We may collect information about how you use the app, including pages viewed, time spent on pages, and navigation behavior.',
                ),
                _buildBulletText(
                  'Device Information: We collect information about your mobile device, such as its model, operating system, and unique device identifiers.',
                ),
                SizedBox(height: 20),
                Text(
                  'How We Use Your Information',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'The information we collect is used for the following purposes:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                _buildBulletText(
                  'To provide and improve our services: We use the collected data to deliver, maintain, and improve the performance of the app.',
                ),
                _buildBulletText(
                  'To communicate with you: Your contact information may be used to send notifications, updates, or respond to inquiries.',
                ),
                _buildBulletText(
                  'To ensure security: We may use your data to detect and prevent fraudulent activities or abuse of the app.',
                ),
                SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                        activeColor: Color(0xFFF16C69),
                      ),
                      Flexible(
                        child: Text(
                          "I Agree to the Privacy Policy",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!_isChecked)
                  Center(
                    child: Text(
                      'Please agree to the Privacy Policy to proceed.',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.red,
                          fontSize: 12),
                    ),
                  ),
                SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: _isChecked
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pop(context);
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalStyles.buttonColorsmall,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(139, 46),
                    ),
                    child: Text(
                      'I Agree',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBulletText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\u2022',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              height: 1.55,
              color: Colors.black),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Poppins', fontSize: 16, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
