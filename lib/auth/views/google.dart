import 'package:flutter/material.dart';
import 'package:nannycare/auth/views/loginpage.dart';
import 'package:nannycare/auth/widgets/option_page.dart';
import 'package:nannycare/utils/customTextField.dart';

class GooglePage extends StatefulWidget {
  const GooglePage({super.key});

  @override
  State<GooglePage> createState() => _GooglePageState();
}

class _GooglePageState extends State<GooglePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
        }, icon: Icon(Icons.keyboard_arrow_left, size: 35,)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset('assets/google2.png'),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
                obscureText: false,
                controller: emailController,
                hintText: 'Email address:',
                icon: Icons.person),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
                obscureText: true,
                controller: passwordController1,
                hintText: 'Password:',
                icon: Icons.lock),
            const SizedBox(height: 40),
            CustomButton(text: 'LOGIN', onPressed: () {}),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
