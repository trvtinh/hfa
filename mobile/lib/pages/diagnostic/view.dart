import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/diagnostic/page/important_view.dart';
import 'package:health_for_all/pages/diagnostic/page/unread_view.dart';
import 'package:health_for_all/pages/diagnostic/page/seen_view.dart';
import 'package:health_for_all/pages/diagnostic_add/view.dart';

class DiagnosticPage extends StatelessWidget {
  const DiagnosticPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Chẩn đoán'),
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/HFA_small_icon.png',
                ),
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text('Chưa xem'),
                ),
                Tab(
                  child: Text('Quan trọng'),
                ),
                Tab(
                  child: Text('Đã xem'),
                ),
              ],
            ),
          ),
          // body:
          // Obx(
          //   () => controller.appController.state.profile.value != null
          //       ? const TabBarView(
          //           children: [
          //             UnreadPage(),
          //             ImportantPage(),
          //             SeenPage(),
          //           ],
          //         )
          // ),
          body: const TabBarView(
            children: [
              UnreadPage(),
              ImportantPage(),
              SeenPage(),
            ],
          ),
        ),
      ),
    );
  }
}
