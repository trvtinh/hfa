import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/alarm/controller.dart';

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
          SizedBox(width: 12,),
        ],
      ),
      body: Column(
        children: [
          Divider(height: 1,),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                add_alarm()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget add_alarm(){
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [

        ],
      ),
    );
  }
}
