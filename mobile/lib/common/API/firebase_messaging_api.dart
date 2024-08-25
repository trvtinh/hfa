import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;

class FirebaseMessagingApi {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    await messaging.setAutoInitEnabled(true);
    // Request permission for iOS
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      announcement: false,
    );

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }

    // Get the token and update Firestore
    String? token = await messaging.getToken();
    if (token != null) {
      await _storeFcmTokenLocally(token);
    }

    // Listen for token refresh
    messaging.onTokenRefresh.listen((newToken) async {
      await _storeFcmTokenLocally(newToken);
    });

    // // Handle foreground messages
    // FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
    //   if (message != null) {
    //     print('Title: ${message.notification!.title}');
    //     print('Body: ${message.notification!.body}');
    //     print('Payload: ${message.data}');
    //     String tripId = message.data['tripId'];
    //     print('Trip ID: $tripId');
    //     _showNotification(message);
    //   }
    // });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('foreground message');
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        LocalNotifications.showNotification(
          title: message.notification?.title,
          body: message.notification?.body,
          payload: message.data.toString(),
        );
      }
    });

    // Handle background messages
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
      if (message != null) {
        print('Title: ${message.notification!.title}');
        print('Body: ${message.notification!.body}');
        print('Payload: ${message.data}');
        String tripId = message.data['tripId'];
        print('Trip ID: $tripId');
      }
    });
  }

  static Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id', // Replace with your channel id
      'your_channel_name', // Replace with your channel name
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      platformChannelSpecifics,
    );
  }

  static Future<void> _storeFcmTokenLocally(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcmtoken', token);
    print('FCM Token stored locally: $token');
  }

  static Future<void> updateFcmTokenInFirestore(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('fcmtoken');
    if (token != null) {
      String id = await FirebaseApi.getDocumentId('users', 'id', userId) ?? "";
      await _firestore.collection('users').doc(id).update({
        'fcmtoken': token,
      });
      print('FCM Token updated for user: $userId');
    }
  }

  static Future sendMessage(
      String fcmtoken, String title, String body, String type) async {
    final String serverkey = await getAccessToken();
    const String endpointCloudMessaging =
        'https://fcm.googleapis.com/v1/projects/hfa---health-for-all/messages:send';
    final Map<String, dynamic> data = {
      'message': {
        "token": fcmtoken,
        'notification': {"title": title, "body": body},
        'data': {"type": type}
      }
    };
    await http
        .post(Uri.parse(endpointCloudMessaging),
            body: jsonEncode(data),
            headers: <String, String>{
              "Content-Type": 'application/json',
              "Authorization": 'Bearer $serverkey'
            })
        .then((response) => log('thanh cong gui tin nhan$response'))
        .catchError((e) => log(e.toString()));
  }

  static Future<String> getAccessToken() async {
    final String serviceAccountJson = dotenv.env['SERVICE_ACCOUNT_KEY']!;
    final Map<String, dynamic> serviceAccount = {
      "type": "service_account",
      "project_id": "hfa---health-for-all",
      "private_key_id": "de5fe2c279bbf2b3b06b8b0dbb16418d442b3cdc",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCSLTZJJdtlTO71\nq845Wi5VxE+gKEufZ2BIH/XCS/6eO/jfP6Ah5jcSGonwMpIlZSQDLPyTPMFW0jbx\nsuzbDIh44dwS/ljVQLHF7H2mpE+AgyAVVgR57Tp89CusN/isrYz0f9AvLNGqrx4w\nDC0W09mSJ3WWVOk1BV1R1bHf9w01lknhuTrjA87JK++/7whzMfXtRRlNRinDhOF1\nnfgbtLJHcJGjVBfQVuttarxU9xnAKL0u7ZhNlvDa58rpKLkcBk3rW91MNplSvCmh\n/epwt9IVcMKkF5KA72sHXfsY1XUbgRsJYoG5NJBKwY4MFxvoRzTmRQGCi5XhM+vR\n5j+iEg79AgMBAAECggEADBLudTfKibFDWqj8gXm8sopizlaNuoayKfrz1H7s8tp+\nycfqXOp0WYs2IhA3SJ30TcvZN/sweBCoh6nRDR3Zpux2/l2ibkjn9jJ8xXc0due9\nzm1atMx+xIPxmInOAUtbhXWKN19TGS9aRbs3vTc19S/Ls2VjluTQyrnlNZvlLCwU\nBsF8vKGDXf4iqan133eA+EGF1xBVwW8HGg2TkWHI9kwfNuROFBLbFiIVx2Bh/iAo\nd0Um0AgkuhvzZ0Z+Uu2+dheSc/lZ/vgrZuxnufHJBUHD5IAGksvmIDRTiVpnJplT\npza9BnwyBE4vdrkdUG3x77rnFFOIdj6k5VLgAKuTyQKBgQDI8k1vxq6Df37lnUOT\nvdfT1U4/tpO49Zn2AFp1C92hv2funKzw6OlohOLETciS/R26Qm/sLDHg+YZncY28\nwrmOEazEQ3NycHIt0AvGxQO1fXl4XmRzgx3RqWiCbdp6asAKMF5dDA/WiFTw901Q\nZDWou3z1KrO+xBH7Hg19ivYuVQKBgQC6OYmukJNLDRJpwZkwF5H8vqqrvE8dGQbO\n4+e/yTSgSAtnHnaVy9MV7QcLgIkbfir22CBc03Ln+mms/p2F4DUApbKGN0tgR83N\neFyJr3BkYUKPILW6/Y9Y+ZXQLA2fqpJmpOf+XBlpO+sFw9VkNLCGF/2gY8dklalU\nK2wFFpK2CQKBgQCNj60f1m7wsmvaJI0L0szuLbH/TocI4PTCigMvu9k57pawUW3A\nFcUA3cTHGCj57Bj6M32Xepb077RQwX1hgiioPilg5ke5UiANyCfTss1nGOru8kh/\n29mw71BxuiQU44lAZEzF7g5mSwrT6tRrkvz+Tn68VIXmGUi1iLlmPPQrNQKBgFKj\n0/iWifbFP0WVN0DDRPKvPhfmAgm8oGvRcXeHd4YlUoIZX7CL+gmB3R16ld2QeMqA\nEKSA5T4SvzCY8RiG7Z5y6a1r/lQkqSykXBRxuWOiUaIodt0bRrDKWXQ/CHCxhjRs\nu9MB1fkAMQSm6hyE0U1Aejnh7YsyaylB97auVL7ZAoGBAJOFW8VBHw90e9zNceCL\nw/6gQCLDp/a8kyrBTNhr3qmMn+HiVLsJy9natKsPbJziyvgVD9BbV0BEeJBm8VtG\naEwqvaUufyr6bE8bGUmQel+QOWSvNKX7TkJDTZ/vINLp5jDKlK3kCQcDdGjHlczf\nvBXeVRcmnbivJMjoeUVHFF40\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-apoxl@hfa---health-for-all.iam.gserviceaccount.com",
      "client_id": "116811572846471892898",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-apoxl%40hfa---health-for-all.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      'https://www.googleapis.com/auth/firebase.messaging',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/userinfo.email'
    ];

    final auth.ServiceAccountCredentials credentials =
        auth.ServiceAccountCredentials.fromJson(serviceAccount);

    final http.Client client = http.Client();
    final auth.AccessCredentials accessCredentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
      credentials,
      scopes,
      client,
    );

    client.close();

    return accessCredentials.accessToken.data;
  }
}
