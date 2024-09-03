import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/alarm/controller.dart';
import 'package:health_for_all/pages/alarm/widget/add_alarm.dart';
import 'package:health_for_all/pages/alarm/widget/list_alarm.dart';
import 'package:health_for_all/pages/reminder/widget/add_reminder.dart';
import 'package:health_for_all/pages/reminder/widget/list_reminder.dart';

class ReminderPage extends GetView<AlarmController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cài đặt nhắc nhở',
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
                add_reminder(context),
                SizedBox(
                  height: 16,
                ),
                list_reminder(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int number_reminder = 4;
  Widget list_reminder(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Text(
                "Danh sách nhắc nhở (" + number_reminder.toString() + ")",
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
        for (int i = 0; i < number_reminder; i++) ListReminder(index: i),
      ],
    );
  }

  Widget add_reminder(BuildContext context) {
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
            Icon(
              Icons.edit_calendar_outlined,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Thêm mới nhắc nhở",
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
                AddReminder(),
              ],
            ),
          ),
        );
      },
    );
  }
}
