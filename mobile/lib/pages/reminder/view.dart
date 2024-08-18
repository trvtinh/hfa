import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/reminder/controller.dart';

class ReminderPage extends GetView<ReminderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cài đặt nhắc nhở'),
      ),
    );
  }
}
