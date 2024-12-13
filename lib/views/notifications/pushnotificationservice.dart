import 'dart:convert';  // Import for jsonEncode
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class PushNotificationService {
  // Get an access token using service account credentials
  static Future<String> getAccessToken() async {
    final serviceAccountJson = {
      // "type": "service_account",
      // "project_id": "nanny-cares",
      // "private_key_id": "263cfc12c2e7a3481d9666e9ed1fc11a15e18321",
      // "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCMvMqB0OFArPtj\nW5lloQpFzzTiWcklekky4OSyZaYIBTTvI4LtUUrULFKSzuzRID+HOccyJpES63M7\nyEiJKseiABq5sWYz8lKOBPe+pzIwdqmfw6SW9txLe5gznJWhUj2AV4vBBVSRSVp2\ndlFqJESucxSYHRPGrc4s5kne3dhAb2uMj0e1X+BjFbhcGRfxuQP4GOCI7emOueWA\nrn4e/zW6iLxWV7XtscmL262lbJHT7Eyf5vdf1tSp023hnshe+aGdO5eXxWNhCi/L\nXcWhjbUVMb83c6Dj+P8XyaW0UJSA4OV52Lf8mTSKa0i2Dd8oMsjM4BezZNcG3CWO\nbEFISBIVAgMBAAECggEAO1e3w/lBobXO4lxTWCkJXdo7IF5flG/1wYBWrmpyEduw\nME22/T5T4Rc3UjPyY1PHtctFFP5yGZoyIrkW7M+fEc4ddsM4pxq8eKnblQaHASxn\n5bfnBMjepu1chha2eSlmSWGgyijnOcPGY0EMn0bftvdLbcCFADd1QjVwXIsKjlBM\n48iy1sRsWAgcTkwmhRDoOMbL1HsRWsoEiuBp+YfEBU82Sac4urHdzGFkCPsE/l6a\nuJSzL/gGt/z4GdOmQ6LJegjFStNjNsQiyp0FMnYn2N6omU07jQzEssYX1ToK1LBS\n8xM8d14ZnGP5RZtLjVylxk6bYFrfu/YH8XlmGqeL2QKBgQC+1XoF7isw+UiZLIIr\nvpi6smQmgKVFmknYmAK9Qbz0/vF7cesGru5FEPaYsisYadI5pKB96Gacp2EG24+w\nNxXD17I837gJk8bDJfc/bwwcvivtCoa84c9d/McTXS9A40qTotlWex6ONqugM3KD\nDW/fS4g5XhfmxKkuyEiG8pf/VwKBgQC8y+5EuqHXX65Jy9mBHZ7bXiKEdNSVTPOH\n1UzmsuNNMS0OJ6X4InwRwMVlMOzlB7jw15iOIzMDx352mSd+qKY2sqw/p0cxzHRE\nnm+MjqII2bIBdYTsNrRslUlva+ttrXR0O7Hrg7c6FSWQmDSE6libZrvPmDiTVVvu\nFsdxve3ScwKBgQC2dB51exAag8yQfoh6UIFvxs2QLmFV2b0O889yqV6DExlIgFNI\nEYpHyH8s4PPpJIvVhvvXRZKN5k4TI2sO/Ku3kgucvf0UUxCvViY9pOt8s6oFuZG3\nF2KPJvYjIm3iaS3NV97aG17Mc6LFyUqL2BYE9Q9qYfcSMSbcTqthMqJ2gwKBgQCo\n4cNBt7EN94jwemkWFmkD0jEOS3PeGfe+ig9ATsUFR/gFsXHFhRN2zfnFiv5d4YqN\n5k2Q1+vKdamqbVXm9vW3+Bwc1IXbBgj7WL5v/Sb0w8d3hqhgpI7Aksod4Wu3sHF7\nh+qfwjMkwcXYkk5olziryjo2ePQi1zhkwfumwz76AQKBgQC8aOW+lwZntrtZcT4h\nfjv1ApU9ms4QlkK2cgviN3lC9I+Z/W9WAsK4l0KTJZsmbFHbnyGers3LTaxmsd/k\nuI9uX7z6EedM80UKwOSHj90TK5F4obAT+2wNCuzbVJluXlLxkquWyBjVvrQxt4h6\nf/oKY1nVy0lxw+fM0cIrgBLYbA==\n-----END PRIVATE KEY-----\n",
      // "client_email": "firebase-adminsdk-h64fh@nanny-cares.iam.gserviceaccount.com",
      // "client_id": "114273639400127377004",
      // "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      // "token_uri": "https://oauth2.googleapis.com/token",
      // "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      // "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-h64fh%40nanny-cares.iam.gserviceaccount.com",
      // "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/firebase.messaging",
      "https://www.googleapis.com/auth/firebase.database"
    ];

    // Create a client for the service account
    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    // Get the access token
    auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    client.close();
    return credentials.accessToken.data;
  }

  // Send notification via Firebase Cloud Messaging
  static Future<void> sendNotificationChannelVerificationCodeRequest(
    String deviceToken,
    BuildContext context,
    String userID,
    String title,
    String body,
  ) async {
    final String serverKey = await getAccessToken();
    String endpointFirebaseCloudMessaging = 'https://fcm.googleapis.com/v1/projects/nanny-cares/messages:send';

    // Construct the notification message
    final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {
          'title': title,
          'body': body // Example message, you can customize it
        },
      },
    };

    // Send the request
    final response = await http.post(
      Uri.parse(endpointFirebaseCloudMessaging),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverKey',
      },
      body: jsonEncode(message), // Use jsonEncode here instead of message.toString()
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification: ${response.body}');
    }
  }
}
