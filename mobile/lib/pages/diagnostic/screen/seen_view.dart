import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/diagnostic/information.dart';
import 'package:health_for_all/pages/diagnostic/widget/animated_container.dart';

class SeenPage extends StatefulWidget {
  const SeenPage({super.key});

  @override
  State<SeenPage> createState() => _SeenPageState();
}

class _SeenPageState extends State<SeenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(Seen.doctors.length, (index) {
            return animatedcontainer(
              doctor: Seen.doctors[index],
              time: Seen.timeDate[index],
              title: Seen.titles[index][0],
              value: Seen.values[index][0],
              unit: Seen.titles[index][0],
              notification: Seen.notifications[index],
              isImportant: Seen.isImportant[index],
              attachments: Seen.attachments[index],
              isAttached: Seen.isAttached[index],
              isExpanded: false.obs,
              index: index,
              page: 3,
            );
          }),
        ),
      ),
    );
  }
}
