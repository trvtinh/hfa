import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/diagnostic/widget/animated_container.dart';

class SeenPage extends StatefulWidget {
  const SeenPage({super.key});

  @override
  State<SeenPage> createState() => _SeenPageState();
}

class _SeenPageState extends State<SeenPage> {
  final List<String> notifications = [
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
  ];

  final List<String> doctors = ['Trần Văn C', 'Lê Thị D', 'Đặng Văn E'];

  final List<String> timeDate = [
    '06:00, 29/07/2024',
    '06:00, 29/07/2024',
    '06:00, 29/07/2024',
  ];

  final List<String> attachments = ['0', '0', '3'];
  final List<bool> isAttached = [false, false, true];
  final List<RxBool> isImportant = [
    false.obs,
    false.obs,
    false.obs,
  ].obs;

  final List<List<String>> titles = [
    ['Huyết áp', 'Thân nhiệt', 'XN Máu'],
    ['Huyết áp', 'Thân nhiệt', 'XN Máu'],
    ['Huyết áp', 'Thân nhiệt', 'XN Máu'],
  ];

  final List<List<String>> times = [
    ['09:00', '09:00', '09:00'],
    ['09:00', '09:00', '09:00'],
    ['09:00', '09:00', '09:00'],
  ];

  final List<List<String>> values = [
    ['120/80', '36', 'XN'],
    ['120/80', '36', 'XN'],
    ['120/80', '36', 'XN'],
  ];

  final List<List<String>> units = [
    ['mmHg', '°C', '--'],
    ['mmHg', '°C', '--'],
    ['mmHg', '°C', '--'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(doctors.length, (index) {
            return animatedcontainer(
                doctor: doctors[index],
                time: timeDate[index],
                title: titles[index][0],
                value: values[index][0],
                unit: units[index][0],
                notification: notifications[index],
                isImportant: isImportant[index],
                attachments: attachments[index],
                isAttached: isAttached[index],
                isExpanded: false.obs,
                index: index);
          }),
        ),
      ),
    );
  }
}
