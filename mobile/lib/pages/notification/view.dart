import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/notification/controller.dart';
import 'package:health_for_all/pages/notification/screen/unread.dart';
import 'package:health_for_all/pages/notification/screen/notice.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Column(children: [
          // thanh chọn
          TabBar(
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              tabs: [
                Tab(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Chưa đọc',
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 13,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Thêm thuộc tính này để cắt ngắn văn bản nếu quá dài
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Obx(() {
                          if (controller.state.unread.value > 0) {
                            return Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red[900],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                      controller.state.unread.value.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8,
                                      )),
                                ));
                          } else {
                            return Container();
                          }
                        })
                      ]),
                ),
                Tab(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cảnh báo',
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 13,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Thêm thuộc tính này để cắt ngắn văn bản nếu quá dài
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Obx(() {
                          if (controller.state.unread.value > 0) {
                            return Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red[900],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                      controller.state.unread.value.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8,
                                      )),
                                ));
                          } else {
                            return Container();
                          }
                        })
                      ]),
                ),
                Tab(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Nhắc nhở',
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 13,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Thêm thuộc tính này để cắt ngắn văn bản nếu quá dài
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Obx(() {
                          if (controller.state.unread.value > 0) {
                            return Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red[900],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                      controller.state.unread.value.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8,
                                      )),
                                ));
                          } else {
                            return Container();
                          }
                        })
                      ]),
                ),
                Tab(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Đã đọc',
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 13,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Thêm thuộc tính này để cắt ngắn văn bản nếu quá dài
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Obx(() {
                          if (controller.state.unread.value > 0) {
                            return Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red[900],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                      controller.state.unread.value.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8,
                                      )),
                                ));
                          } else {
                            return Container();
                          }
                        })
                      ]),
                ),
              ]),
          // liệt kê body
          Expanded(
              child: TabBarView(
            children: [
              Unread(
                uid: controller.appController.state.profile.value!.id!,
                type: 'unread',
              ),
              Notice(),
              Notice(),
              Unread(
                uid: controller.appController.state.profile.value!.id!,
                type: 'read',
              ),
            ],
          ))
        ]));
  }
}
