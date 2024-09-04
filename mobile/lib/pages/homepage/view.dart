import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/alarm/view.dart';
import 'package:health_for_all/pages/application/controller.dart';
import 'package:health_for_all/pages/chatbot/view.dart';
import 'package:health_for_all/pages/connect_hardware/view.dart';
import 'package:health_for_all/pages/diagnostic/view.dart';
import 'package:health_for_all/pages/homepage/widget/white_box.dart';
import 'package:health_for_all/pages/homepage/widget/orange_box.dart';
import 'package:health_for_all/pages/notification/view.dart';
import 'package:health_for_all/pages/prescription/index.dart';
import 'package:health_for_all/pages/profile/index.dart';
import 'package:health_for_all/pages/reminder/view.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final appController = Get.find<ApplicationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const ProfilePage());
              },
              child: Container(
                height: 80,
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.primaryContainer,
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
                      Obx(() => Row(children: [
                            const SizedBox(width: 12),
                            CircleAvatar(
                                radius: 28,
                                backgroundImage: CachedNetworkImageProvider(
                                    appController
                                            .state.profile.value?.photourl ??
                                        "https://www.google.com/url?sa=i&url=https%3A%2F%2Ficonduck.com%2Ficons%2F160691%2Favatar-default-symbolic&psig=AOvVaw2gPEQ_lKQuUXivxfgTKXo-&ust=1723564687779000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIi5g4Hp74cDFQAAAAAdAAAAABAE")),
                            const SizedBox(width: 12),
                            Container(
                              width: 130,
                              height: 56,
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        appController
                                                .state.profile.value?.name ??
                                            "",
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 88,
                                        height: 20,
                                        child: Row(
                                          children: [
                                            Text(
                                              appController.state.profile.value
                                                      ?.gender ??
                                                  "",
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromRGBO(
                                                    121, 116, 126, 1),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              appController.state.profile.value
                                                          ?.age !=
                                                      0
                                                  ? ("${appController.state.profile.value?.age} tuổi")
                                                  : '',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromRGBO(
                                                    121, 116, 126, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 146,
                              height: 56,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 120,
                                    height: 16,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Người nhà:",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                121, 116, 126, 1),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 30,
                                        // ),
                                        Badge(
                                          // child: Text("2"),
                                          label: Text(appController
                                                  .state
                                                  .profile
                                                  .value
                                                  ?.relatives
                                                  ?.length
                                                  .toString() ??
                                              "0"),
                                          largeSize: 16,
                                          backgroundColor: const Color.fromRGBO(
                                              125, 82, 96, 1),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    height: 16,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Chuyên gia:",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                121, 116, 126, 1),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 30,
                                        // ),
                                        Badge(
                                          // child: Text("2"),
                                          label: Text(appController
                                                  .state
                                                  .profile
                                                  .value
                                                  ?.doctors
                                                  ?.length
                                                  .toString() ??
                                              "0"),
                                          largeSize: 16,
                                          backgroundColor: const Color.fromRGBO(
                                              125, 82, 96, 1),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    height: 16,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Đang theo dõi:",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                121, 116, 126, 1),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 30,
                                        // ),
                                        Badge(
                                          // child: Text("2"),
                                          label: Text(
                                            ((appController
                                                            .state
                                                            .profile
                                                            .value
                                                            ?.relatives
                                                            ?.length ??
                                                        0) +
                                                    (appController
                                                            .state
                                                            .profile
                                                            .value
                                                            ?.patients
                                                            ?.length ??
                                                        0))
                                                .toString(),
                                          ),

                                          largeSize: 16,
                                          backgroundColor: const Color.fromRGBO(
                                              125, 82, 96, 1),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]))
                    ]),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(() => Orangebox(
                val1: "03",
                val2: "07",
                val3: "10",
                time: appController.state.updateTime.value == ""
                    ? "Chưa cập nhật dữ liệu lần nào"
                    : "Cập nhật lần cuối ${appController.state.updateTime.value}")),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const DiagnosticPage());
                  },
                  child: Obx(
                    () => WhiteBox(
                        title: 'Chẩn đoán',
                        iconpath: 'assets/images/health_and_safety.png',
                        text1: 'Chưa xem',
                        text2: 'Đã xem',
                        value1: appController
                            .diagnosticController.state.unread.value
                            .toString(),
                        value2: appController
                            .diagnosticController.state.read.value
                            .toString()),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => PrescriptionPage());
                  },
                  child: const WhiteBox(
                      title: 'Đơn thuốc',
                      iconpath: 'assets/images/medication_liquid.png',
                      text1: 'Đang uống',
                      text2: 'Hoàn thành',
                      value1: '03',
                      value2: '07'),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => ReminderPage());
                  },
                  child: const WhiteBoxnoW(
                      title: 'Nhắc nhở',
                      iconpath: 'assets/images/date_range.png',
                      text1: 'Số lời nhắc',
                      value1: '07'),
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => const AlarmPage());
                    },
                    child: Obx(() => WhiteBoxnoW(
                          title: 'Cảnh báo',
                          iconpath: 'assets/images/warning_amber.png',
                          text1: 'Số cảnh báo',
                          value1: appController
                              .alarmController.numberAlarm.value
                              .toString(),
                        ))),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const NotiPage());
                  },
                  child: Obx(() => WhiteBox(
                      title: 'Thông báo',
                      iconpath: 'assets/images/notifications.png',
                      text1: 'Chưa xem',
                      text2: 'Đã xem',
                      value1: appController.notificationController.state.unread
                          .toString(),
                      value2: appController.notificationController.state.read
                          .toString())),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ChatbotPage());
                  },
                  child: const WhiteBoxnoVal(
                      title: 'Trò chuyện với HFA',
                      iconpath: 'assets/images/smart_toy.png',
                      text1: 'Trò chuyện y tế',
                      text2: 'với HFA'),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => ConnectHardwarePage());
              },
              child: Container(
                height: 84,
                width: 380,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromRGBO(234, 221, 255, 1),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        // offset: Offset(0, 3), // changes position of shadow
                      )
                    ]),
                child: const Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 356,
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kết nối với thiết bị",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
                    SizedBox(
                      width: 356,
                      height: 32,
                      child: Row(
                        children: [
                          Icon(
                            Icons.developer_board,
                            size: 32,
                            color: Color.fromRGBO(101, 85, 143, 1),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Đang kết nối",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(52, 199, 89, 1),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "HFA-Careport-0123",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(33, 0, 93, 1),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
    // return const Center(
    //   child: Text('Homepage'),
    // );
  }
}

class NotiPage extends StatelessWidget {
  const NotiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông báo'),
        centerTitle: true,
      ),
      body: const NotificationPage(),
    );
  }
}
