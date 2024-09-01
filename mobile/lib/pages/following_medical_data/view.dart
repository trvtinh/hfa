import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/entities/user.dart';
import 'package:health_for_all/pages/following_medical_data/widget/following_person_box.dart';
import 'package:health_for_all/pages/homepage/widget/white_box.dart';
import 'package:health_for_all/pages/overall_medical_data_history/view.dart';
import 'controller.dart';

class FollowingMedicalData extends GetView<FollowingMedicalDataController> {
  final UserData user;
  final String role;
  final String time;
  const FollowingMedicalData(
      {super.key, required this.user, required this.role, required this.time});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đang theo dõi'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            controller.followingController.overallMedicalDataHistoryController
                .state.selectedUserId.value = '';
            controller.followingController.overallMedicalDataHistoryController
                .state.selectedUser.value = UserData();
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/HFA_small_icon.png',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            const SizedBox(height: 12),
            FollowingPersonBox(
              avapath: user.photourl!,
              name: user.name!,
              gender: user.gender ?? 'Nam',
              age: user.age == 0 ? 'Chưa cập nhật' : user.age.toString(),
              person: role,
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Get.to(() => OverallMedicalDataHistoryPage());
              },
              child: Container(
                height: 124,
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        // offset: Offset(0, 3), // changes position of shadow
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 356,
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dữ liệu sức khỏe",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            Icons.open_in_new,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 356,
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.monitor_heart_outlined,
                            size: 48,
                            color: Color.fromRGBO(101, 85, 143, 1),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 48,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Chưa cập nhật",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(121, 116, 126, 1),
                                        ),
                                      ),
                                      Text(
                                        '03',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Color.fromRGBO(179, 38, 30, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 48,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Đã cập nhật",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(121, 116, 126, 1),
                                        ),
                                      ),
                                      Text(
                                        '07',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Color.fromRGBO(52, 199, 89, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 48,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Tổng số",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(121, 116, 126, 1),
                                        ),
                                      ),
                                      Text(
                                        '10',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Color.fromRGBO(29, 27, 32, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 356,
                      height: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            time != ''
                                ? "Cập nhật lần cuối: $time"
                                : 'Chưa cập nhật',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(121, 116, 126, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WhiteBox(
                    title: 'Chẩn đoán',
                    iconpath: 'assets/images/health_and_safety.png',
                    text1: 'Chưa xem',
                    text2: 'Đã xem',
                    value1: '03',
                    value2: '07'),
                WhiteBox(
                    title: 'Đơn thuốc',
                    iconpath: 'assets/images/medication_liquid.png',
                    text1: 'Đang uống',
                    text2: 'Hoàn thành',
                    value1: '03',
                    value2: '07'),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WhiteBoxnoW(
                    title: 'Nhắc nhở',
                    iconpath: 'assets/images/date_range.png',
                    text1: 'Số lời nhắc',
                    value1: '07'),
                WhiteBoxnoW(
                    title: 'Cảnh báo',
                    iconpath: 'assets/images/warning_amber.png',
                    text1: 'Số cảnh báo',
                    value1: '07'),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WhiteBox(
                    title: 'Thông báo',
                    iconpath: 'assets/images/notifications.png',
                    text1: 'Chưa xem',
                    text2: 'Đã xem',
                    value1: '03',
                    value2: '07'),
                SizedBox(
                  width: 185,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
