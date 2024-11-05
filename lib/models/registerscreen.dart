import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/models/location_mapscreen.dart';
import 'package:module2_4_lab_exercise/models/loginpage.dart';
import 'package:module2_4_lab_exercise/utils/customButton.dart';

import 'package:module2_4_lab_exercise/widget/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Use separate controllers for each text field
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  bool otpSent = false; // Flag to check if OTP was sent
  bool otpVerified = false; // Flag to check if OTP was verified

  void sendOTP() {
    // Mock OTP sending process
    setState(() {
      otpSent = true; // OTP is sent, now user can enter it
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('OTP sent to your contact number')),
    );
  }

  void verifyOTP() {
    // Mock OTP verification
    if (otpController.text == '123456') {
      setState(() {
        otpVerified = true; // OTP is verified
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP verified!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    buildSocialButton(dynamic icon, colorVal, final name) => Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(76, 226, 226, 226)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: colorVal,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(name),
            ],
          ),
        );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 500,
            child: Image.asset('assets/flutter.jpg'),
          ),
          Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centers the buttons
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey, // Sets text color to grey
                  ),
                  child: const Text('Login'),
                ),
                const SizedBox(width: 10), // Adds space between buttons
                const Text('|',
                    style: TextStyle(color: Colors.black)), // Divider text
                const SizedBox(width: 10), // Adds space after divider
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor:
                        const Color(0xFFFFAFCC), // Sets text color to #FFAFCC
                  ),
                  child: const Text('Register'),
                ),
              ],
            ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                CustomTextField(
                    obscureText: false,
                    controller: usernameController,
                    hintText: 'Username:',
                    icon: Icons.people),
                const SizedBox(height: 15),
                CustomTextField(
                  obscureText: true,
                  controller: passwordController,
                  hintText: 'Password:',
                  icon: Icons.lock,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                    obscureText: false,
                    controller: contactController,
                    hintText: 'Contact Number:',
                    icon: Icons.phone),
                const SizedBox(height: 15),
                otpSent
                    ? CustomTextField(
                        obscureText: false,
                        controller: otpController,
                        hintText: 'Enter OTP:',
                        icon: Icons.security,
                      )
                    : const SizedBox.shrink(), // Show OTP field only after OTP is sent
                const SizedBox(height: 15),
                CustomTextField(
                    obscureText: false,
                    controller: emailController,
                    hintText: 'Email Address:',
                    icon: Icons.email),
                const SizedBox(height: 25),
                // Button to send OTP
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  child: customBtn('Next', () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GoogleMapsPage()));
                  })),
                const SizedBox(height: 20),
                const OrDivider(),
                const SizedBox(height: 10),
                InkWell(
                    child: buildSocialButton(
                        Icons.facebook, Colors.blue, 'FACEBOOK')),
                const SizedBox(height: 20),
                InkWell(
                    child: buildSocialButton(Icons.mail, Colors.pink, 'GOOGLE')),
                const SizedBox(height: 10),

                footerTitle(() {
                  // Navigate to the LoginPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }, 'Registered?', 'LOGIN'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 200),
      child: Row(
        children: [
          buildDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: Text(
              "or",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(),
    );
  }
}
