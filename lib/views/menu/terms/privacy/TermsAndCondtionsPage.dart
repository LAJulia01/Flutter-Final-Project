// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nannycare/utils/styles.dart';
import 'package:nannycare/views/menu/widgets/settings_appbar_widget.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({super.key});

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(title: 'Terms and Conditions', context: context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              '''Welcome to Nanny Care! These Terms and Conditions outline the rules for using the Nanny Care mobile application and the services offered through it. By accessing or using the App, you agree to follow and be bound by these Terms. If you do not agree to them, please refrain from using the App.

By downloading, accessing, or using the App, you agree to abide by these Terms. You also consent to our Privacy Policy, which is included as part of these Terms. To use the App, you must be at least 18 years old or meet the legal age requirement in your area. Nanny Care serves as a platform that links parents or guardians ("Parents") with freelance babysitters ("Babysitters"). While the app facilitates the arrangement of babysitting services, it does not directly offer these services. Babysitters are independent contractors and are not employed by Nanny Care Booking App.''',
              style: TextStyle(
                  fontFamily: 'Poppins', fontSize: 16.0, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'User Conduct',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'You agree to use the App in a lawful and respectful manner. You must not:',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            _buildBulletText(
              'Use the App for illegal purposes.',
            ),
            _buildBulletText(
              'Violate any laws or regulations applicable to your use of the App.',
            ),
            _buildBulletText(
              'Engage in any fraudulent, abusive, or harmful behavior.',
            ),
            SizedBox(height: 24.0),
            Text(
              '''Nanny Care reserves the right to suspend or terminate your account at its discretion if you violate these Terms or engage in behavior that is harmful to the App or its users. These Terms are governed by and construed in accordance with the law. Any disputes arising out of or relating to these Terms or the use of the App shall be resolved in the courts. If you have any questions or concerns regarding these Terms, please contact us at: [Insert Contact Information].''',
              style: TextStyle(
                  fontFamily: 'Poppins', fontSize: 16.0, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.0),
            Row(
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
                    "I Agree to the Terms and Conditions",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            if (!_isChecked)
              Center(
                child: Text(
                  'Please agree to the Terms and Conditions to proceed.',
                  style: TextStyle(
                      fontFamily: 'Poppins', color: Colors.red, fontSize: 12),
                ),
              ),
            SizedBox(height: 10.0),
            Center(
              child: ElevatedButton(
                onPressed: _isChecked
                    ? () {
                        Navigator.pop(context);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalStyles.buttonColorsmall,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(139, 46),
                ),
                child: Text(
                  'I Agree',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
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
