import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/home/view.dart';
import 'package:health_for_all/pages/notification/controller.dart';
import 'package:health_for_all/pages/notification/widget/unread.dart';
import 'package:health_for_all/pages/notification/widget/notice.dart';
import 'package:health_for_all/pages/notification/widget/remind.dart';
import 'package:health_for_all/pages/notification/widget/read.dart';

class NotificationPage extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            // thanh chọn
            appBar: AppBar(
                bottom: TabBar(tabs: [
              Tab(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Chưa đọc',
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.red[900],
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text('1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  )),
                            )),
                      ],
                    ),
                  ),
                ]),
              ),
              Tab(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Cảnh báo',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red[900],
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text('1',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                            )),
                      )),
                ]),
              ),
              Tab(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Nhắc nhở',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red[900],
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text('1',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                            )),
                      )),
                ]),
              ),
              Tab(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Đã đọc',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red[900],
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text('1',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                            )),
                      )),
                ]),
              ),
            ])),

            // liệt kê body
            body: TabBarView(
              children: [Unread(), Notice(), Homepage(), Homepage()],
            )));
  }
}
