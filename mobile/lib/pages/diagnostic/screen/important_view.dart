import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/diagnostic/information.dart';
import 'package:health_for_all/pages/diagnostic/widget/animated_container.dart';

class ImportantPage extends StatefulWidget {
  const ImportantPage({super.key});

  @override
  State<ImportantPage> createState() => _ImportantPageState();
}

class _ImportantPageState extends State<ImportantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(Important.doctors.length, (index) {
            return animatedcontainer(
              doctor: Important.doctors[index],
              time: Important.timeDate[index],
              title: Important.titles[index][0],
              value: Important.values[index][0],
              unit: Important.titles[index][0],
              notification: Important.notifications[index],
              isImportant: Important.isImportant[index],
              attachments: Important.attachments[index],
              isAttached: Important.isAttached[index],
              isExpanded: false.obs,
              index: index,
              page: 2,
            );
          }),
        ),
      ),
    );
  }
}
