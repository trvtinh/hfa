import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/diagnostic_detail/view.dart';

class UnreadPage extends StatefulWidget {
  const UnreadPage({super.key});

  @override
  State<UnreadPage> createState() => _UnreadPageState();
}

class _UnreadPageState extends State<UnreadPage> {
  List<bool> _isExpandedList = [false, false, false];

  final List<String> notifications = [
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại',
    'Với chỉ số như hiện tại có nguy cơ nhồi máu cơ tim. Đề nghị tới bệnh viện khám lại'
  ];

  final List<String> patients = ['Nguyễn Văn A', 'Nguyễn Văn B', 'Trần Văn C'];

  final List<String> timeDate = [
    '06:00, 29/07/2024',
    '06:00, 29/07/2024',
    '06:00, 29/07/2024',
  ];

  final List<String> attachments = ['1', '2', '0'];
  final List<bool> isAttached = [true, true, false];
  final List<bool> isImportant = [false, true, true];

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

  void _setImportant(int index) {
    setState(() {
      isImportant[index] = !isImportant[index];
    });
  }

  void _toggleContainer(int index) {
    setState(() {
      _isExpandedList[index] = !_isExpandedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(_isExpandedList.length, (index) {
            return GestureDetector(
              onTap: () => _toggleContainer(index),
              child: ClipRect(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: MediaQuery.of(context).size.width,
                  height: _isExpandedList[index]
                      ? isAttached[index]
                          ? 200
                          : 180
                      : 104,
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
                                patients[index],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                timeDate[index],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Icon(
                                Icons.star,
                                color: isImportant[index]
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .surfaceContainerLow,
                                size: 16,
                              ),
                            ],
                          ),
                          Icon(
                            _isExpandedList[index]
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_down_outlined,
                            size: 16,
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
                            titles[index][0],
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${values[index][0]} ${units[index][0]}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notifications[index],
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (isAttached[index])
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              Icon(
                                Icons.attach_file_outlined,
                                size: 18,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Đính kèm (${attachments[index]})',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => DetailView(index: index));
                            },
                            child: SizedBox(
                              height: 40,
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 3,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Chi tiết',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => _setImportant(index),
                            child: SizedBox(
                              height: 40,
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    isImportant[index]
                                        ? Icons.star
                                        : Icons.star_border_outlined,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Quan trọng',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 3,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Đã đọc',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
