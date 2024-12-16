import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:nannycare/auth/views/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nannycare/babysitter/notificationpage2.dart';
import 'package:nannycare/firebase_api.dart';
import 'firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class AppConstants {
  static const String channelId = 'nannycare_notifications';
  static const String channelName = 'NannyCare Notifications';
  static const String welcomeTitle = 'Welcome!';
  static const String welcomeBody = 'To Nanny Cares.';
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
  await _initializeNotifications();
  
  runApp(const MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Received a message in the background!');
  const AndroidNotificationDetails androidNotificationDetails = 
      AndroidNotificationDetails(
    AppConstants.channelId, 
    AppConstants.channelName,
    channelDescription: 'Background notification for NannyCare',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails notificationDetails = 
      NotificationDetails(android: androidNotificationDetails);

  await flutterLocalNotificationsPlugin.show(
    0,
    message.notification?.title ?? 'New Notification',
    message.notification?.body ?? 'You have a new message',
    notificationDetails,
  );
}

Future<void> _initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid = 
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings = 
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await FirebaseApi().initNotifications();
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
    _showLocalNotification();
  }

  Future<void> _initializeFCM() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        setState(() {
          _fcmToken = token;
        });
        print("FCM Token: $_fcmToken");
      } else {
        print("FCM Token is null. Retrying...");
        await Future.delayed(const Duration(seconds: 2));
        await _initializeFCM(); // Retry logic
      }
    } catch (e) {
      print("Error retrieving FCM token: $e");
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      setState(() {
        _fcmToken = newToken;
      });
      print("FCM Token refreshed: $newToken");
      await _updateToken(newToken); // Send updated token to backend
    });
  }

  Future<void> _updateToken(String token) async {
    try {
      print("Updating token on server: $token");
      // Add logic to send the token to the server
    } catch (e) {
      print("Error updating token on server: $e");
    }
  }

  Future<void> _showLocalNotification() async {
    const AndroidNotificationDetails androidNotificationDetails = 
        AndroidNotificationDetails(
      AppConstants.channelId, 
      AppConstants.channelName,
      channelDescription: 'This is a test channel',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const NotificationDetails notificationDetails = 
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      AppConstants.welcomeTitle, // Notification title
      AppConstants.welcomeBody, // Notification body
      notificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nanny Cares',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xffFFC1CC),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: {
        NotificationPage2.route: (context) => NotificationPage2(),
      },
    );
  }
}
