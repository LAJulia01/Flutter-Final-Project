import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:nannycare/auth/views/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('Received a message in the background!');
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _fcmToken;

  @override
  void initState() {
    super.initState();
    _initializeFCM();
  }

  /// This function will initialize Firebase Messaging and retrieve the FCM token
  Future<void> _initializeFCM() async {
    // Get the FCM token
    String? token = await FirebaseMessaging.instance.getToken();
    setState(() {
      _fcmToken = token;
    });

    if (_fcmToken != null) {
      print("FCM Token: $_fcmToken");
      // You can now use this token to send push notifications or store it on your server.
    } else {
      print("Failed to get FCM Token");
    }

    // Listen for token refresh
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      setState(() {
        _fcmToken = newToken;
      });
      print("FCM Token refreshed: $newToken");
    });
  }

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
