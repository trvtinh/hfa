import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_for_all/common/entities/user.dart';
import 'package:health_for_all/common/routes/names.dart';
import 'package:health_for_all/common/store/user.dart';

import 'state.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['https://www.googleapis.com/auth/cloud-platform']);

class SignInController extends GetxController {
  final state = SignInState();
  final db = FirebaseFirestore.instance;

  Future<void> handleSignIn() async {
    try {
      final user = await _googleSignIn.signIn();

      if (user != null) {
        log(user.toString());
        final gAuthentication = await user.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: gAuthentication.idToken,
          accessToken: gAuthentication.accessToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        final displayName = user.displayName ?? user.email;
        final email = user.email;
        final id = user.id;
        final photoUrl = user.photoUrl ?? "";

        final userProfile = UserLoginResponseEntity()
          ..email = email
          ..accessToken = id
          ..displayName = displayName
          ..photoUrl = photoUrl;

        log(userProfile.toString());
        UserStore.to.saveProfile(userProfile);

        final userbase = await db
            .collection("users")
            .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData userdata, options) =>
                  userdata.toFirestore(),
            )
            .where("id", isEqualTo: id)
            .get();

        if (userbase.docs.isEmpty) {
          final data = UserData(
            id: id,
            name: displayName,
            email: email,
            photourl: photoUrl,
            age: 0,
            doctors: [],
            patients: [],
            relatives: [],
            phoneNumber: '',
            gender: '',
            dateOfBirth: '',
            location: "",
            fcmtoken: "",
            addtime: Timestamp.now(),
          );

          await db
              .collection("users")
              .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userdata, options) =>
                    userdata.toFirestore(),
              )
              .add(data);
        }
        log('đăng nhâp thành công');
        Get.offAndToNamed(AppRoutes.Application);
      }
    } catch (e) {
      // Replace with a proper error handling mechanism
      print("Login error: $e");
    }
  }

  @override
  void onReady() {
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("User is currently logged out");
      } else {
        print("User is logged in");
      }
    });
  }
}
