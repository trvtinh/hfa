import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/connect_hardware/controller.dart';

class ConnectHardwarePage extends GetView<ConnectHardwareController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect Hardware'),
      ),
    );
  }
}
