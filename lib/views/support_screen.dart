import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  const Support({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image at the top
            Center(
              child: Image.asset(
                'images/penny.png',
                width: 100, // Adjust width as needed
                height: 100, // Adjust height as needed
              ),
            ),
            const SizedBox(height: 16), // Space between image and text
            // Centered text
            const Text(
              'Support Center',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32), // Space between text and buttons
            // Box buttons
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildBoxButton(
                  context,
                  'Button 1',
                  'images/image1.png', // Replace with your image
                  const NextScreen1(),
                ),
                const SizedBox(height: 16), // Space between buttons
                _buildBoxButton(
                  context,
                  'Button 2',
                  'images/image2.png', // Replace with your image
                  const NextScreen2(),
                ),
                const SizedBox(height: 16), // Space between buttons
                _buildBoxButton(
                  context,
                  'Button 3',
                  'images/image3.png', // Replace with your image
                  const NextScreen3(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildBoxButton(
      BuildContext context, String text, String imagePath, Widget nextScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue, // Button color
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  imagePath,
                  width: 40, // Adjust width as needed
                  height: 40, // Adjust height as needed
                ),
                const SizedBox(width: 8), // Space between image and text
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white, // Icon color
            ),
          ],
        ),
      ),
    );
  }
}
// Placeholder screens for navigation
class NextScreen1 extends StatelessWidget {
  const NextScreen1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Screen 1')),
      body: const Center(child: Text('This is Next Screen 1')),
    );
  }
}
class NextScreen2 extends StatelessWidget {
  const NextScreen2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Screen 2')),
      body: const Center(child: Text('This is Next Screen 2')),
    );
  }
}
class NextScreen3 extends StatelessWidget {
  const NextScreen3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Screen 3')),
      body: const Center(child: Text('This is Next Screen 3')),
    );
  }
}