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
            Center(
              child: Image.asset(
                'images/penny.png',
                width: 100,
                height: 100,
                semanticLabel: 'Support Center Logo', // For accessibility
              ),
            ),
              const SizedBox(height: 16),
            
            // Centered text
            const Text(
              'Support Center',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Box buttons
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildBoxButton(
                  context,
                  'Button 1',
                  'images/image1.png',
                  const NextScreen1(),
                ),
                const SizedBox(height: 16),
                _buildBoxButton(
                  context,
                  'Button 2',
                  'images/image2.png',
                  const NextScreen2(),
                ),
                const SizedBox(height: 16),
                _buildBoxButton(
                  context,
                  'Button 3',
                  'images/image3.png',
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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  imagePath,
                  width: 40,
                  height: 40,
                  semanticLabel: '$text Icon', // For accessibility
                ),
                const SizedBox(width: 8),
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
              color: Colors.white,
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
