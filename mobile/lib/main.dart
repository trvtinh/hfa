import 'dart:developer';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_messaging_api.dart';
import 'package:health_for_all/common/entities/user.dart';
import 'package:health_for_all/common/routes/names.dart';
import 'package:health_for_all/common/services/notification.dart';
import 'common/routes/pages.dart';
import 'common/services/storage.dart';
import 'common/store/config.dart';
import 'common/store/user.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('background message');
  LocalNotifications.showNotification(
    title: message.notification?.title,
    body: message.notification?.body,
    payload: message.data.toString(),
  );
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
  await FirebaseMessagingApi.init();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  try {
    await dotenv.load(fileName: ".env");
    String accessToken = await FirebaseMessagingApi.getAccessToken();
    log('access token$accessToken');
  } catch (e) {
    print("Error loading .env file: $e");
  }
  final credentials = StorageService.to.getUserCredentials();
  if (credentials['userEmail'] != null && credentials['accessToken'] != null) {
    final userProfile = UserLoginResponseEntity()
      ..email = credentials['userEmail']!
      ..accessToken = credentials['accessToken']!
      ..displayName = credentials['displayName']!
      ..photoUrl = credentials['photoUrl']!;

    log(userProfile.toString());
    UserStore.to.saveProfile(userProfile);

    runApp(const MyApp(initialRoute: AppRoutes.Application));
  } else {
    runApp(const MyApp(initialRoute: AppPages.SignIn));
  }
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (BuildContext context, Widget? child) => GetMaterialApp(
              title: 'Health For All',
              // theme: ThemeData(
              //   primarySwatch: Colors.,
              // ),
              initialRoute: initialRoute,
              getPages: AppPages.routes,
              debugShowCheckedModeBanner: false,
            ));
  }
}
