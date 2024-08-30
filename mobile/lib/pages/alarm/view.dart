import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/alarm/controller.dart';
import 'package:health_for_all/pages/alarm/widget/add_alarm.dart';
import 'package:health_for_all/pages/alarm/widget/list_alarm.dart';

class AlarmPage extends GetView<AlarmController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cài đặt cảnh báo',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 22,
          ),
        ),
        actions: [
          Icon(
            Icons.help_outline,
            size: 24,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: Column(
        children: [
          Divider(
            height: 1,
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                add_alarm(context),
                SizedBox(
                  height: 16,
                ),
                list_alarm(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int number_alarm = 4;
  Widget list_alarm(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Text(
                "Danh sách cảnh báo (" + number_alarm.toString() + ")",
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
        ),
        SizedBox(
          height: 16,
        ),
        for (int i = 0; i < number_alarm; i++) ListAlarm(index: i),
      ],
    );
  }

  Widget add_alarm(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _showAddDialog(context);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Theme.of(context).colorScheme.errorContainer,
          boxShadow: [
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
            Image.asset(
              "assets/images/warning_add.png",
              height: 32,
              width: 32,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Thêm mới cảnh báo",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 10),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AddAlarm(),
              ],
            ),
          ),
        );
      },
    );
  }
}
