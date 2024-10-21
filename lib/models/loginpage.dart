import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/utils/customButton.dart';
import 'package:module2_4_lab_exercise/utils/customTextField.dart';

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
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 500,
            child: Image.asset('assets/flutter.png'),
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
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  obscureText: true,
                  controller: passwordController1,
                  hintText: 'Password:',
                  icon: Icons.lock,
                ),
                const SizedBox(height: 5),
                const Row(
                  children: [Text('     Forget Password')],
                ),
                const SizedBox(height: 25),
                const CustomButton(text: 'LOG IN'),
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
                footerTitle(() {}, 'Not Register yet?', 'REGISTER'),
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
