  import 'package:flutter/material.dart';
import 'package:nannycare/auth/views/authen_page.dart';
import 'package:nannycare/auth/views/facebook.dart';
import 'package:nannycare/auth/views/registerscreen.dart';
import 'package:nannycare/auth/widgets/forget_password.dart';
import 'package:nannycare/auth/widgets/option_page.dart';
import 'package:nannycare/utils/customButton.dart';
import 'package:nannycare/utils/customTextField.dart';
import 'package:nannycare/utils/styles/style/textstyle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formfield = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  bool passToggle = true;

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
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            width: 300,
            child: Image.asset('assets/NANNY’S CARE (4).png'),
          ),
          Text(
              'Login',
              style: AppTextStyles.subHeader.copyWith(color: Color(0xFFF5A7A5)),
            ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Form(
                  key: _formfield,
                  child: Column(
                    children: [
                      CustomTextField(
                          obscureText: false,
                          controller: emailController,
                          hintText: 'Email address:',
                          icon: Icons.email),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: passToggle,
                        controller: passwordController1,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 200, 210),
                          )),
                          border: const OutlineInputBorder(),
                          hintText: 'Password',
                          suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },
                              child: Icon(passToggle
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          }
                          else if(passwordController1.text.length < 6){
                            return "Password Length Should be more than 6 characters";
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                         Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ForgetPassword())); 
                        },
                        child: Text('Forgot Password')),
                  ],
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    if (_formfield.currentState!.validate()) {
                      print("success");
                      emailController.clear();
                      passwordController1.clear();
                      Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AuthenPage()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 1, color: Colors.black),
                    minimumSize: const Size.fromHeight(54),
                    backgroundColor: const Color(0xFFF5A7A5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: Text(
                    'Login',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins'),
                  ),
                ),
                const SizedBox(height: 10),
                OrDivider(),
                const SizedBox(height: 10),
                InkWell(
                    onTap: () {},
                    child:
                        buildSocialButton(Icons.mail, Colors.pink, 'GOOGLE')),
                const SizedBox(height: 10),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FacebookPage()));
                    },
                    child: buildSocialButton(
                        Icons.facebook, Colors.blue, 'FACEBOOK')),
                const SizedBox(
                  height: 40,
                ),
                footerTitle(() {
                    Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterPage()));
                }, 'Not Registered yet?', 'REGISTER'),
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
