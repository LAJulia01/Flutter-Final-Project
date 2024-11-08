import 'package:flutter/material.dart';



class HelpandsuppPage3 extends StatelessWidget {
  const HelpandsuppPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FAQScreen(),
    );
  }
}

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back navigation
          },
        ),
        title: Text(
          'FAQs',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FAQSection(
                title: 'Account and Login Issues',
                faqs: [
                  FAQ(
                    question: 'How do I create an account on the Nanny Cares app?',
                    answer:
                        'To create an account, open the app and click on “Register.” Enter your email address, create a password, and follow the prompts to complete the registration process.',
                  ),
                  FAQ(
                    question: 'What should I do if I forget my password?',
                    answer:
                        'If you forget your password, click on “Forgot Password” on the login screen. Enter your registered email address, and you’ll receive instructions on how to reset your password.',
                  ),
                ],
              ),
              FAQSection(
                title: 'Technical Issues',
                faqs: [
                  FAQ(
                    question: 'What should I do if the Nanny Cares app is not working properly?',
                    answer:
                        'If the app is not working properly, try restarting your device, ensuring you have the latest version of the app, and checking your internet connection. If the issue persists, contact Nanny Cares support.',
                  ),
                  FAQ(
                    question: 'How do I report a bug or issue with the app?',
                    answer:
                        'To report a bug, go to the “Help & Support” section in the app and select “Send us an E-mail.” Provide a detailed description of the issue, and the support team will assist you.',
                  ),
                ],
              ),
              FAQSection(
                title: 'Security and Privacy',
                faqs: [
                  FAQ(
                    question: 'How is my data protected in the Nanny Cares app?',
                    answer:
                        'The Nanny Cares app uses advanced encryption and security protocols to protect your data. Your information is stored securely and is only accessible to authorized users.',
                  ),
                  FAQ(
                    question: 'How can I delete my account and data from the Nanny Cares app?',
                    answer:
                        'To delete your account, go to the “Account Settings” section, select “Delete Account,” and follow the prompts. This will permanently remove your data from the app.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.pink[100],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation actions
        },
      ),
    );
  }
}

class FAQSection extends StatelessWidget {
  final String title;
  final List<FAQ> faqs;

  const FAQSection({
    super.key,
    required this.title,
    required this.faqs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ...faqs.map((faq) => FAQItem(faq: faq)),
        SizedBox(height: 20),
      ],
    );
  }
}

class FAQItem extends StatelessWidget {
  final FAQ faq;

  const FAQItem({
    super.key,
    required this.faq,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Q: ${faq.question}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text('A: ${faq.answer}'),
        ],
      ),
    );
  }
}

class FAQ {
  final String question;
  final String answer;

  FAQ({required this.question, required this.answer});
}
