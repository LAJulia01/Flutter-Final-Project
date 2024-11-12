import 'package:flutter/material.dart';
import 'package:nannycare/auth/authen_page.dart';
import 'package:nannycare/auth/registerscreen.dart';
import 'package:nannycare/auth/widgets/forget_password.dart';
import 'package:nannycare/utils/customButton.dart';
import 'package:nannycare/utils/customTextField.dart';
import 'package:nannycare/utils/styles/style/textstyle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController1 = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset('assets/NANNY’S CARE (4).png'),
            ),
            Text(
              'Login',
              style: AppTextStyles.subHeader.copyWith(color: Color(0xFFF5A7A5)),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  CustomTextField(
                      obscureText: false,
                      controller: emailController,
                      hintText: 'Username:',
                      icon: Icons.people),
                  const SizedBox(height: 15),
                  CustomTextField(
                    obscureText: true,
                    controller: passwordController1,
                    hintText: 'Password:',
                    icon: Icons.lock,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ForgetPassword()));
                        },
                        child: const Text('Forget Password'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                      text: 'LOGIN',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AuthenPage()));
                      }),
                  const SizedBox(height: 20),
                  const OrDivider(),
                  const SizedBox(height: 10),
                  InkWell(
                      child:
                          buildSocialButton(Icons.mail, Colors.pink, 'GOOGLE')),
                  const SizedBox(height: 10),
                  InkWell(
                      child: buildSocialButton(
                          Icons.facebook, Colors.blue, 'FACEBOOK')),
                  const SizedBox(height: 20),
                  footerTitle(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  }, 'Not Registered yet?', 'REGISTER'),
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
            padding: EdgeInsets.symmetric(horizontal: 5),
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
