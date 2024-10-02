import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/connect_hardware/controller.dart';
import 'package:health_for_all/pages/connect_hardware/widget/find_device.dart';
import 'package:health_for_all/pages/connect_hardware/widget/status_device.dart';

class ConnectHardwarePage extends GetView<ConnectHardwareController> {
  ConnectHardwarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Connect Hardware',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 22,
          ),
        ),
        actions: [
          Icon(
            Icons.help_outline,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 24,
          ),
          const SizedBox(
            width: 12,
          )
        ],
      ),
      body: Column(
        children: [
          const Divider(
            height: 1,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                find_device(context),
                const SizedBox(
                  height: 16,
                ),
                connect_samsung(context),
                const SizedBox(
                  height: 16,
                ),
                list_connect(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget find_device(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              spreadRadius: 0.6,
              blurRadius: 2,
              // offset: Offset(0, 3), // changes position of shadow
            )
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.manage_search,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Tìm kiếm thiết bị",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget connect_samsung(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              spreadRadius: 0.6,
              blurRadius: 2,
            )
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.add_circle_outline,
              color: Theme.of(context).colorScheme.primary,
              size: 32,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Kết nối với Samsung Health",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }

  int num_device = 3;
  List<String> name_device = [
    "HFA-Careport-0123",
    "HFA-Careport-0124",
    "HFA-Careport-0125",
  ];
  List<bool> check_device = [
    true,
    false,
    false,
  ];

  Widget list_connect(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Text(
                "Danh sách nhắc nhở ($num_device)",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
        ),
        const SizedBox(
          height: 16,
        ),
        for (int i = 0; i < num_device; i++)
          StatusDevice(connected: check_device[i], name_device: name_device[i]),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          content: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FindDevice(
                  complete_find_all: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
