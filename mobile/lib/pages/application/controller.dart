import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_for_all/common/entities/user.dart';
import 'package:health_for_all/common/routes/names.dart';
import 'package:health_for_all/common/store/user.dart';
import 'index.dart';

import 'package:get/get.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: <String>[
    'email',
    'http://www.googleapis.com/auth/contacts.readonly'
  ]);
  ApplicationController();

  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void handPageChanged(int index) {
    state.page = index;
  }

  void handleNavBarTap(int index) {
    pageController.jumpToPage(index);
  }

  Future<UserData> getProfile() async {
    try {
      String profile = await UserStore.to.getProfile();

      if (profile.isNotEmpty) {
        UserLoginResponseEntity userdata =
            UserLoginResponseEntity.fromJson(jsonDecode(profile));
        state.head_detail.value = userdata;
        log('Dữ liệu local: ${state.head_detail.value.toString()}');

        final userCollection = FirebaseFirestore.instance.collection('users');
        final query = userCollection.where('id',
            isEqualTo: state.head_detail.value!.accessToken);

        final querySnapshot = await query.get();

        if (querySnapshot.docs.isNotEmpty) {
          final documentSnapshot = querySnapshot
              .docs.first; // Lấy tài liệu đầu tiên từ kết quả truy vấn
          state.profile.value = UserData.fromFirestore(documentSnapshot, null);
          log(state.profile.value.toString());

          // Thực hiện các thao tác khác với userData
        } else {
          log('User does not exist.');
        }
      } else {
        log("Lỗi lấy dữ liệu local");
      }
    } catch (e) {
      log('Lỗi khi lấy hồ sơ: $e');
    }
    return state.profile.value!;
  }

  @override
  void onInit() async {
    super.onInit();
    getProfile();

    tabTitles = ['Của tôi', 'Đang theo dõi', "Thêm", "Thông báo", 'Cá nhân'];
    bottomTabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.medical_information,
          size: 28,
        ),
        activeIcon: Icon(Icons.medical_information, size: 28),
        label: 'Của tôi',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.family_restroom, size: 28),
        activeIcon: Icon(Icons.family_restroom, size: 28),
        label: 'Đang theo dõi',
      ),
      const BottomNavigationBarItem(
        icon: CustomIcon(
          icon: Icons.add_circle_outline,
          size: 56,
          sizeIcon: 24,
        ),
        activeIcon: CustomIcon(
          icon: Icons.add_circle_outline,
          size: 56,
          sizeIcon: 24,
        ),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.notifications, size: 28),
        activeIcon: Icon(Icons.notifications, size: 28),
        label: 'Thông báo',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined, size: 28),
        activeIcon: Icon(Icons.account_circle_outlined, size: 28),
        label: 'Cá nhân',
      ),
    ];
    pageController = PageController(initialPage: state.page);
  }

  Future<void> onLogOut() async {
    UserStore.to.onLogout();
    await googleSignIn.signOut();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final double sizeIcon;

  const CustomIcon({
    required this.icon,
    required this.size,
    required this.sizeIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .primary, // Background color of the circle
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          size: sizeIcon, // Adjust icon size as needed
          color: Theme.of(context).colorScheme.onPrimary, // Icon color
        ),
      ),
    );
  }
}
