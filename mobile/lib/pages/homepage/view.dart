import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/entities/prescription.dart';
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
import 'package:intl/intl.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final appController = Get.find<ApplicationController>();

  DateTime convertStringtoTime(String date) {
    DateFormat format = DateFormat('dd/MM/yyyy');
    DateTime dateTime = format.parse(date);
    return dateTime;
  }

  DateTime getYesterdayTimestamp() {
    DateTime now = DateTime.now(); // Get the current date and time
    DateTime yesterday = now.subtract(Duration(days: 1)); // Subtract one day
    return yesterday; // This returns the DateTime object for yesterday
  }

  bool compareTimestamps(DateTime timestamp1, DateTime timestamp2) {
    return timestamp1
        .isAfter(timestamp2); // true if timestamp1 is before timestamp2
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              height: 1,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ProfilePage());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
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
                                  CircleAvatar(
                                      radius: 28,
                                      backgroundImage: CachedNetworkImageProvider(
                                          appController.state.profile.value
                                                  ?.photourl ??
                                              "https://www.google.com/url?sa=i&url=https%3A%2F%2Ficonduck.com%2Ficons%2F160691%2Favatar-default-symbolic&psig=AOvVaw2gPEQ_lKQuUXivxfgTKXo-&ust=1723564687779000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIi5g4Hp74cDFQAAAAAdAAAAABAE")),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Wrap(
                                              children: [
                                                Text(
                                                  appController.state.profile
                                                          .value?.name ??
                                                      "",
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
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
                                            // const SizedBox(
                                            //   width: 12,
                                            // ),
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
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "Người nhà:",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    121, 116, 126, 1),
                                              ),
                                            ),
                                            const Spacer(),
                                            Badge(
                                              label: Text(
                                                  style: const TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                  appController
                                                          .state
                                                          .profile
                                                          .value
                                                          ?.relatives
                                                          ?.length
                                                          .toString() ??
                                                      "0"),
                                              largeSize: 16,
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Chuyên gia:",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    121, 116, 126, 1),
                                              ),
                                            ),
                                            const Spacer(),
                                            Badge(
                                              label: Text(
                                                  style: const TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                  appController
                                                          .state
                                                          .profile
                                                          .value
                                                          ?.doctors
                                                          ?.length
                                                          .toString() ??
                                                      "0"),
                                              largeSize: 16,
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      125, 82, 96, 1),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Đang theo dõi:",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    121, 116, 126, 1),
                                              ),
                                            ),
                                            const Spacer(),
                                            Badge(
                                              label: Text(
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                ),
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
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      125, 82, 96, 1),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ]))
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(() => Orangebox(
                      val1: "00",
                      val2: "10",
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
                              iconbox: Icons.health_and_safety_outlined,
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
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const PrescriptionPage());
                        },
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('prescriptions')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Có lỗi xảy ra');
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }

                            final data = snapshot.data!.docs
                                .map((doc) => Prescription.fromFirestore(doc
                                    as DocumentSnapshot<Map<String, dynamic>>))
                                .toList();
                            int finished = 0;
                            int drinking = 0;
                            for (var i in data){
                              if (compareTimestamps(convertStringtoTime(i.endDate!), getYesterdayTimestamp())) drinking ++;
                              else finished ++;
                            }
                            return WhiteBox(
                                title: 'Đơn thuốc',
                                iconbox: Icons.medication_liquid_sharp,
                                text1: 'Đang uống',
                                text2: 'Hoàn thành',
                                value1: drinking.toString(),
                                value2: finished.toString());
                          },
                        ),
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
                            iconbox: Icons.date_range_outlined,
                            text1: 'Số lời nhắc',
                            value1: '00'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.to(() => const AlarmPage());
                          },
                          child: Obx(() => WhiteBoxnoW(
                                title: 'Cảnh báo',
                                iconbox: Icons.warning_amber_outlined,
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
                            iconbox: Icons.notifications_outlined,
                            text1: 'Chưa xem',
                            text2: 'Đã xem',
                            value1: appController
                                .notificationController.state.unread
                                .toString(),
                            value2: appController
                                .notificationController.state.read
                                .toString())),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const ChatbotPage());
                        },
                        child: const WhiteBoxnoVal(
                            title: 'Trò chuyện với HFA',
                            iconbox: Icons.smart_toy_outlined,
                            text1: 'Trò chuyện y tế với HFA'),
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
                      height: 87,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color.fromRGBO(234, 221, 255, 1),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                            )
                          ]),
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kết nối với thiết bị",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                              Icon(
                                Icons.open_in_new,
                                size: 16,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
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
