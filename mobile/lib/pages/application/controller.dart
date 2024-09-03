import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_for_all/common/entities/user.dart';
import 'package:health_for_all/common/helper/datetime_change.dart';
import 'package:health_for_all/common/routes/names.dart';
import 'package:health_for_all/common/store/user.dart';
import 'package:health_for_all/pages/alarm/controller.dart';
import 'package:health_for_all/pages/diagnostic/controller.dart';
import 'package:health_for_all/pages/notification/controller.dart';
import 'package:health_for_all/pages/prescription/controller.dart';
import 'index.dart';

import 'package:get/get.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: <String>[
    'email',
    'http://www.googleapis.com/auth/contacts.readonly'
  ]);
  ApplicationController();
  final notificationController = Get.find<NotificationController>();
  final diagnosticController = Get.find<DiagnosticController>();
  final prescriptionController = Get.find<PrescriptionController>();
  final AlarmController alarmController = Get.find<AlarmController>();
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
          if (state.profile.value?.dateOfBirth != "") {
            state.profile.value?.age = DatetimeChange.getAge(
                state.profile.value!.dateOfBirth!.toString());
          }
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

  @override
  void onReady() async {
    await getProfile();
    notificationController.state.profile.value = state.profile.value;
    diagnosticController.state.profile.value = state.profile.value;
    alarmController.state.profile.value = state.profile.value;
    prescriptionController.state.profile.value = state.profile.value;
    notificationController.fetchNotificationCounts();
    diagnosticController.fetchDiagnosticNotifications();
    alarmController.getAlarmCount();
    log('Dữ liệu diagnostic noti: ${diagnosticController.state.profile.value.toString()}');

    log('Dữ liệu profile noti: ${notificationController.state.profile.value.toString()}');
    getUpdatedDataTime(); // Chuyển từ await sang chỉ gọi hàm để tạo stream lắng nghe
    for (int i = 0; i < 10; i++) {
      getUpdatedLatestMedical(i.toString());
    }

    state.medicalData.forEach((key, value) {
      log('Dữ liệu y tế: $key - $value');
    });
    super.onReady();
  }

  Future<void> onLogOut() async {
    await UserStore.to.onLogout();
    await googleSignIn.signOut();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }

  void getUpdatedDataTime() {
    final db = FirebaseFirestore.instance;
    try {
      final time = Timestamp.fromDate(DateTime.now());

      // Lắng nghe sự thay đổi của dữ liệu trong Firestore
      db
          .collection('medicalData')
          .where('userId', isEqualTo: state.profile.value!.id!)
          .where('time', isLessThanOrEqualTo: time)
          .orderBy('time', descending: true)
          .limit(1)
          .snapshots()
          .listen((querySnapshot) {
        if (querySnapshot.docs.isEmpty) {
          state.updateTime.value = '';
        } else {
          final data = querySnapshot.docs.first.data();
          log(data.toString());
          state.updateTime.value =
              '${DatetimeChange.getHourString(data['time'].toDate())} ${DatetimeChange.getDatetimeString(data['time'].toDate())}';
        }
      }, onError: (error) {
        print('Error fetching updated time: $error');
      });
    } catch (e) {
      print('Error setting up listener for updated time: $e');
    }
  }

  void getUpdatedLatestMedical(String type) {
    final db = FirebaseFirestore.instance;
    try {
      final time = Timestamp.fromDate(DateTime.now());

      // Lắng nghe sự thay đổi của dữ liệu trong Firestore
      db
          .collection('medicalData')
          .where('userId', isEqualTo: state.profile.value!.id!)
          .where('typeId', isEqualTo: type)
          .where('time', isLessThanOrEqualTo: time)
          .orderBy('time', descending: true)
          .limit(1)
          .snapshots()
          .listen((querySnapshot) {
        if (querySnapshot.docs.isEmpty) {
          state.medicalData[type] = '';
        } else {
          final data = querySnapshot.docs.first.data();
          log(data.toString());
          state.medicalData[type] = data;
          // '${DatetimeChange.getHourString(data['time'].toDate())} ${DatetimeChange.getDatetimeString(data['time'].toDate())}';
        }
      }, onError: (error) {
        print('Error fetching updated time: $error');
      });
    } catch (e) {
      print('Error setting up listener for updated time: $e');
    }
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
    super.key,
  });

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
