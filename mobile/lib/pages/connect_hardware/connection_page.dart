import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/connect_hardware/controller.dart';
import 'package:health_for_all/pages/connect_hardware/widget/data_fetched.dart';

class ConnectionPage extends GetView<ConnectHardwareController> {
  const ConnectionPage({super.key, required this.device});
  final ScanResult device;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ConnectHardwareController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(device.advertisementData.advName),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            controller.scannedDevices.clear();
            controller.clearData();
            await controller.disconnectFromDevice(device.device);
            Get.back();
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const Text('Dữ liệu đo đã nhận'),
                  const SizedBox(height: 10),
                  Obx(() => Expanded(
                      child: ListView.builder(
                          itemCount: controller.state.medId.length,
                          itemBuilder: (context, index) {
                            return DataDay(
                                date: controller.state.medDate[index],
                                time: controller.state.medTime[index],
                                value:
                                    controller.state.medValue[index].toString(),
                                index: index,
                                pass: controller.state.medPass[index]);
                          }))),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        controller.clearData();
                      },
                      child: const Text('Xóa dữ liệu đã nhận'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
