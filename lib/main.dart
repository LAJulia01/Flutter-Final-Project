
import 'package:flutter/material.dart';
import 'package:nannycare/auth/views/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nanny Cares',
      theme: ThemeData(
        colorSchemeSeed: Color(0xffFFC1CC),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
