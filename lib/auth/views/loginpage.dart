import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nannycare/auth/views/authen_page.dart';
import 'package:nannycare/auth/views/registerscreen.dart';
import 'package:nannycare/auth/widgets/customButton.dart';
import 'package:nannycare/auth/widgets/forget_password.dart';
import 'package:nannycare/utils/styles/style/textstyle.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
    // Show a loading dialog
    showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // Attempt to sign in with Firebase
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if the user is successfully signed in
      if (userCredential.user != null) {
        // Navigate to the main page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AuthenPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Dismiss the dialog and set the error message
      Navigator.pop(context);
      setState(() {
        errorMessage = e.message ?? "An error occurred. Please try again.";
      });
    }
  }
Future<void> signInWithGoogle() async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // Check if there is an active Google session
    if (await googleSignIn.isSignedIn()) {
      // Disconnect the current session
      await googleSignIn.disconnect();
    }

    // Trigger the Google Sign-In flow and display the account chooser if the user has multiple accounts
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      // The user canceled the sign-in
      setState(() {
        errorMessage = "Google Sign-In canceled.";
      });
      return;
    }

    // Obtain the Google Sign-In authentication details
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    if (googleAuth.accessToken == null || googleAuth.idToken == null) {
      setState(() {
        errorMessage = "Google authentication failed. Please try again.";
      });
      return;
    }

    // Create a credential for Firebase authentication
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Authenticate with Firebase using the Google credentials
    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    // Navigate to the authenticated page if successful
    if (userCredential.user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthenPage()),
      );
    }
  } on FirebaseAuthException catch (e) {
    setState(() {
      errorMessage = "Failed: ${e.message}";
    });
  } catch (e) {
    setState(() {
      errorMessage = "An unexpected error occurred: $e";
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
          Text(
            'Login',
            style: AppTextStyles.subHeader.copyWith(color: const Color(0xFFF5A7A5)),
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
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
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
                          enabledBorder: const OutlineInputBorder(
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
                          } else if (passwordController1.text.length < 6) {
                            return "Password Length Should be more than 6 characters";
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
                    style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgetPassword()));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
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
                        borderRadius: BorderRadius.circular(25)),
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
                // const OrDivider(),
                const SizedBox(height: 10),
                InkWell(
                  onTap: signInWithGoogle, // Google Sign-In functionality
                  child: buildSocialButton(Icons.mail, Colors.pink, 'GOOGLE'),
                ),
                const SizedBox(height: 10),

                InkWell(
                  onTap: () {},
                  child: buildSocialButton(Icons.facebook, Colors.blue, 'FACEBOOK'),
                ),
                const SizedBox(height: 40),
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

  Widget buildSocialButton(dynamic icon, colorVal, final name) => Container(
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
}


// https://nanny-cares.firebaseapp.com/__/auth/handler