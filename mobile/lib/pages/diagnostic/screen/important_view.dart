import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/diagnostic/widget/animated_container.dart';
import 'package:health_for_all/pages/diagnostic_detail/view.dart';

class ImportantPage extends StatefulWidget {
  const ImportantPage({super.key});

  @override
  State<ImportantPage> createState() => _ImportantPageState();
}

class _ImportantPageState extends State<ImportantPage> {
  final List<String> notifications = [
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
  ];

  final List<String> doctors = [
    'Nguyễn Văn A',
    'Nguyễn Thị B',
    'Trần Văn C',
    'Lê Thị D',
    'Đặng Văn E'
  ];

  final List<String> timeDate = [
    '06:00, 29/07/2024',
    '06:00, 29/07/2024',
    '06:00, 29/07/2024',
    '06:00, 29/07/2024',
    '06:00, 29/07/2024',
  ];

  final List<String> attachments = ['1', '2', '0', '0', '3'];
  final List<bool> isAttached = [true, true, false, false, true];
  final List<RxBool> isImportant = [
    true.obs,
    true.obs,
    true.obs,
    true.obs,
    true.obs,
  ].obs;

  final List<List<String>> titles = [
    ['Huyết áp', 'Thân nhiệt', 'XN Máu'],
    ['Huyết áp', 'Thân nhiệt', 'XN Máu'],
    ['Huyết áp', 'Thân nhiệt', 'XN Máu'],
    ['Huyết áp', 'Thân nhiệt', 'XN Máu'],
    ['Huyết áp', 'Thân nhiệt', 'XN Máu'],
  ];

  final List<List<String>> times = [
    ['09:00', '09:00', '09:00'],
    ['09:00', '09:00', '09:00'],
    ['09:00', '09:00', '09:00'],
    ['09:00', '09:00', '09:00'],
    ['09:00', '09:00', '09:00'],
  ];

  final List<List<String>> values = [
    ['120/80', '36', 'XN'],
    ['120/80', '36', 'XN'],
    ['120/80', '36', 'XN'],
    ['120/80', '36', 'XN'],
    ['120/80', '36', 'XN'],
  ];

  final List<List<String>> units = [
    ['mmHg', '°C', '--'],
    ['mmHg', '°C', '--'],
    ['mmHg', '°C', '--'],
    ['mmHg', '°C', '--'],
    ['mmHg', '°C', '--'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
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
