import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';

import 'common/routes/pages.dart';
import 'common/services/storage.dart';
import 'common/store/config.dart';
import 'common/store/user.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(
      'Title: ${message.notification!.title}'); // Handle background message here
  print('Body: ${message.notification!.body}');
  print('Payload: ${message.data}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<ConfigStore>(ConfigStore());
  Get.put<UserStore>(UserStore());

  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity, // For Android
    appleProvider: AppleProvider.deviceCheck, // For iOS
  );
  // await FirebaseApi.initNotifications();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (BuildContext context, Widget? child) => GetMaterialApp(
              title: 'Health For All',
              // theme: ThemeData(
              //   primarySwatch: Colors.,
              // ),
              initialRoute: AppPages.SignIn,
              getPages: AppPages.routes,
              debugShowCheckedModeBanner: false,
            ));
  }
}