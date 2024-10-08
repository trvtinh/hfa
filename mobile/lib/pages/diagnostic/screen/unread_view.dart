import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/diagnostic/widget/animated_container.dart';
import 'package:health_for_all/pages/diagnostic/information.dart';

class UnreadPage extends StatefulWidget {
  const UnreadPage({super.key});

  @override
  State<UnreadPage> createState() => _UnreadPageState();
}

class _UnreadPageState extends State<UnreadPage> {
  // void _setImportant(int index) {
  //   setState(() {
  //     isImportant[index] = !isImportant[index];
  //   });
  // }

  // void _toggleContainer(int index) {
  //   setState(() {
  //     _isExpandedList[index] = !_isExpandedList[index];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(Unread.doctors.length, (index) {
            return animatedcontainer(
              doctor: Unread.doctors[index],
              time: Unread.timeDate[index],
              title: Unread.titles[index][0],
              value: Unread.values[index][0],
              unit: Unread.titles[index][0],
              notification: Unread.notifications[index],
              isImportant: Unread.isImportant[index],
              attachments: Unread.attachments[index],
              isAttached: Unread.isAttached[index],
              isExpanded: false.obs,
              index: index,
              page: 1,
            );
          }),
        ),
      ),
    );
  }
}
