import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formfield = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  bool passToggle = true;
  String? errorMessage;

  Future<void> loginUser(String email, String password) async {
    showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.pop(context); // Close the progress dialog
      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AuthenPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Close the progress dialog
      setState(() {
        errorMessage = e.message ?? "An error occurred. Please try again.";
      });
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AuthenPage()),
        );
      }
    } catch (e) {
      setState(() {
        errorMessage = "Google Sign-In failed: ${e.toString()}";
      });
    }
  }

Future<void> signInWithFacebook() async {
  try {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      // Use result.accessToken to get the token
      final OAuthCredential credential = FacebookAuthProvider.credential(
        result.accessToken!.token, // Updated way to access token
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthenPage()),
      );
    } else if (result.status == LoginStatus.cancelled) {
      setState(() {
        errorMessage = "Facebook Login cancelled by the user.";
      });
    } else {
      setState(() {
        errorMessage = "Facebook Login failed: ${result.message}";
      });
    }
  } catch (e) {
    setState(() {
      errorMessage = "An error occurred during Facebook Login: $e";
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            width: 300,
            child: Image.asset('assets/NANNY’S CARE (4).png'),
          ),
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF5A7A5),
            ),
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
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email Address:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        obscureText: passToggle,
                        controller: passwordController1,
                        decoration: InputDecoration(
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
                                : Icons.visibility_off),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else if (value.length < 6) {
                            return "Password length should be more than 6 characters";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    if (_formfield.currentState!.validate()) {
                      loginUser(
                        emailController.text.trim(),
                        passwordController1.text.trim(),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 1, color: Colors.black),
                    minimumSize: const Size.fromHeight(54),
                    backgroundColor: const Color(0xFFF5A7A5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins'),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: signInWithGoogle,
                  child: buildSocialButton(Icons.mail, Colors.pink, 'GOOGLE'),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: signInWithFacebook,
                  child:
                      buildSocialButton(Icons.facebook, Colors.blue, 'FACEBOOK'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSocialButton(IconData icon, Color color, String name) => Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(76, 226, 226, 226),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 15),
            Text(name),
          ],
        ),
      );
}

class AuthenPage extends StatelessWidget {
  const AuthenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Welcome to the authenticated page!")),
    );
  }
}
