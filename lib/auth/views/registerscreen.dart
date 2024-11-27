import 'package:flutter/material.dart';
import 'package:nannycare/auth/views/choosing.dart';
import 'package:nannycare/auth/views/loginpage.dart';
import 'package:nannycare/utils/customButton.dart';
import 'package:nannycare/utils/customTextField.dart';
import 'package:nannycare/utils/styles/style/textstyle.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 500,
              child: Image.asset('assets/NANNY’S CARE (4).png'),
            ),
            Text(
              'Register',
              style: AppTextStyles.subHeader.copyWith(color: Color(0xFFF5A7A5)),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  CustomTextField(
                      obscureText: false,
                      controller: usernameController,
                      hintText: 'Name:',
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

                  CustomTextField(
                    obscureText: false,
                    controller: otpController,
                    hintText: 'Enter OTP:',
                    icon: Icons.security,
                  ),
                  const SizedBox
                      .shrink(), // Show OTP field only after OTP is sent
                  const SizedBox(height: 15),
                  CustomTextField(
                      obscureText: false,
                      controller: emailController,
                      hintText: 'Email Address:',
                      icon: Icons.email),
                  const SizedBox(height: 25),
                  // Button to send OTP
                  ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Choosing()));
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 1, color: Colors.black),
                    minimumSize: const Size.fromHeight(54),
                    backgroundColor: const Color(0xFFF5A7A5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: Text(
                    'Next',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins'),
                  ),
                ),
                  const SizedBox(height: 20),
                  OrDivider(),
                  const SizedBox(height: 10),
                  InkWell(
                      child:
                          buildSocialButton(Icons.mail, Colors.pink, 'GOOGLE')),
                  const SizedBox(height: 10),
                  InkWell(
                      child: buildSocialButton(
                          Icons.facebook, Colors.blue, 'FACEBOOK')),
                  const SizedBox(
                    height: 20,
                  ),
                  footerTitle(() {
                    // Navigate to the RegisterPage
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }, 'Registered?', 'LOGIN'),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 100),
      child: Row(
        children: [
          buildDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
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
