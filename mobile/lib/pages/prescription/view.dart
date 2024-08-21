import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/prescription/controller.dart';

class PrescriptionPage extends GetView<PrescriptionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đơn thuốc'),
      ),
    );
  }
}
