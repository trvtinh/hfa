import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/alarm/controller.dart';

class AlarmPage extends GetView<AlarmController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cài đặt cảnh báo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
