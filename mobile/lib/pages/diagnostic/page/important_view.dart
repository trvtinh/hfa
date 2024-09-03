import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/diagnostic_detail/view.dart';

class ImportantPage extends StatefulWidget {
  const ImportantPage({super.key});

  @override
  State<ImportantPage> createState() => _ImportantPageState();
}

class _ImportantPageState extends State<ImportantPage> {
  List<bool> important = [true, true, true, true, true];

  List<String> notifications = [
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
  ];

  List<String> doctors = [
    'Nguyễn Văn A',
    'Nguyễn Thị B',
    'Trần Văn C',
    'Lê Thị D',
    'Đặng Văn E',
  ];

  List<String> time = [
    '06:00,  29/07/2024',
    '06:00,  29/07/2024',
    '06:00,  29/07/2024',
    '06:00,  29/07/2024',
    '06:00,  29/07/2024',
  ];

  List<String> title = [
    'Huyết áp',
    'Huyết áp',
    'Huyết áp',
    'Huyết áp',
    'Huyết áp',
  ];

  List<String> value = [
    '125/80',
    '125/80',
    '125/80',
    '125/80',
    '125/80',
  ];

  List<String> unit = [
    'mg/dL',
    'mg/dL',
    'mg/dL',
    'mg/dL',
    'mg/dL',
  ];

  List<String> attachments = [
    '1',
    '2',
    '0',
    '0',
    '3',
  ];

  List<bool> isattached = [true, true, false, false, true];

  void _setImportant(int index) {
    setState(() {
      important[index] = !important[index];
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
            children: List.generate(notifications.length, (index) {
              return NotificationContainer(
                doctor: doctors[index],
                time: time[index],
                title: title[index],
                value: value[index],
                unit: unit[index],
                notification: notifications[index],
                isImportant: important[index],
                attachments: attachments[index],
                isAttached: isattached[index],
                onTapImportant: () => _setImportant(index),
                onTapDetail: () {
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

class NotificationContainer extends StatelessWidget {
  final String doctor;
  final String time;
  final String title;
  final String value;
  final String unit;
  final String notification;
  final bool isImportant;
  final String attachments;
  final bool isAttached;
  final VoidCallback onTapImportant;
  final VoidCallback onTapDetail;

  const NotificationContainer({
    super.key,
    required this.doctor,
    required this.time,
    required this.title,
    required this.value,
    required this.unit,
    required this.notification,
    required this.isImportant,
    required this.attachments,
    required this.isAttached,
    required this.onTapImportant,
    required this.onTapDetail,
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
                  const SizedBox(width: 16),
                  Text(
                    doctor,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    Icons.star,
                    color: isImportant
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surfaceContainerLow,
                    size: 16,
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
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                '$value $unit',
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
                      'Đính kèm ($attachments)',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
              ],
            ),
          Row(
            children: [
              GestureDetector(
                onTap: onTapDetail,
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
                onTap: onTapImportant,
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
