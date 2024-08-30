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
          body: TabBarView(
            children: [
              UnreadPage(),
              ImportantPage(),
              SeenPage(),
            ],
          ),
          // persistentFooterButtons: [
          //   ElevatedButton(
          //       onPressed: () {
          //         Get.to(() => AddView());
          //       },
          //       child: Container())
          // ],
          bottomSheet: InkWell(
            onTap: () {
              Get.to(() => AddView());
            },
            child: Container(
              height: 56,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  border: Border(
                      top: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        width: 1,
                      ))),
              padding: EdgeInsets.fromLTRB(16, 7, 16, 7),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline_outlined,
                        size: 24,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        height: 40,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Thêm chẩn đoán",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
