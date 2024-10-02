import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/diagnostic_detail/view.dart';

class UnreadPage extends StatefulWidget {
  const UnreadPage({super.key});

  @override
  State<UnreadPage> createState() => _UnreadPageState();
}

class _UnreadPageState extends State<UnreadPage> {
  final List<bool> _important = [false, true, true];

  List<String> notifications = [
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
  ];

  List<String> patient = [
    'Nguyễn Văn A',
    'Nguyễn Văn B',
    'Trần Văn C',
  ];

  List<String> timedate = [
    '06:00, 29/07/2024',
    '06:00, 29/07/2024',
    '06:00, 29/07/2024',
  ];

  final List<String> _attachments = ['1', '2', '0'];

  final List<bool> _isAttached = [true, true, false];

  List<List<String>> title = [
    ['Huyết áp', 'Thân nhiệt', 'XN Máu'],
    ['Huyết áp', 'Thân nhiệt', 'XN Máu'],
    ['Huyết áp', 'Thân nhiệt', 'XN Máu'],
  ];

  List<List<String>> value = [
    ['120/80', '36', 'XN'],
    ['120/80', '36', 'XN'],
    ['120/80', '36', 'XN'],
  ];

  List<List<String>> unit = [
    ['mmHg', '°C', '--'],
    ['mmHg', '°C', '--'],
    ['mmHg', '°C', '--'],
  ];

  void _setImportant(int index) {
    setState(() {
      _important[index] = !_important[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: List.generate(patient.length, (index) {
              return NotificationCard(
                patientName: patient[index],
                timeDate: timedate[index],
                notification: notifications[index],
                isAttached: _isAttached[index],
                attachmentCount: _attachments[index],
                title: title[index],
                value: value[index],
                unit: unit[index],
                isImportant: _important[index],
                onImportantToggle: () => _setImportant(index),
                onDetailTap: () {
                  Get.to(() => DetailView(index: index));
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String patientName;
  final String timeDate;
  final String notification;
  final bool isAttached;
  final String attachmentCount;
  final List<String> title;
  final List<String> value;
  final List<String> unit;
  final bool isImportant;
  final VoidCallback onImportantToggle;
  final VoidCallback onDetailTap;

  const NotificationCard({
    super.key,
    required this.patientName,
    required this.timeDate,
    required this.notification,
    required this.isAttached,
    required this.attachmentCount,
    required this.title,
    required this.value,
    required this.unit,
    required this.isImportant,
    required this.onImportantToggle,
    required this.onDetailTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.health_and_safety_outlined,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    patientName,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    timeDate,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onImportantToggle,
                    child: Icon(
                      Icons.star,
                      color: isImportant
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surfaceContainerLow,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'Đã gửi chẩn đoán',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title[0],
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${value[0]} ${unit[0]}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            notification,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          if (isAttached)
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.attach_file_outlined,
                      size: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Đính kèm ($attachmentCount)',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
              ],
            ),
          Row(
            children: [
              GestureDetector(
                onTap: onDetailTap,
                child: SizedBox(
                  height: 40,
                  width: (MediaQuery.of(context).size.width - 64) / 3,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Chi tiết',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: onImportantToggle,
                child: SizedBox(
                  height: 40,
                  width: (MediaQuery.of(context).size.width - 64) / 3,
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Icon(
                        isImportant ? Icons.star : Icons.star_border_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Quan trọng',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 40,
                  width: (MediaQuery.of(context).size.width - 64) / 3,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Đã đọc',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
