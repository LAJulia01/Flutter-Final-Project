import 'package:flutter/material.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //logo
            Expanded(
              child: Image.asset('images/penny.png'),
            ), //end logo

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
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
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

            // Add space between the row and text fields
            const SizedBox(height: 20),

            // Wrap each TextField in a Container
            const SizedBox(
              width: 300, // Set the desired width here
              child: TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            const SizedBox(height: 10), // Add space between fields

            const SizedBox(
              width: 300,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC8DD), // Background color
                minimumSize: const Size(300, 50), // Width: 2000, Height: 50
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              child: const Text('Login'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Implement Google registration here
                  },
                  icon: Image.asset('assets/google_logo.png'),
                ),
                const SizedBox(height: 16), // Optional spacing between the buttons
                IconButton(
                  onPressed: () {
                    // Implement Facebook registration here
                  },
                  icon: Image.asset('assets/facebook_logo.png'),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}