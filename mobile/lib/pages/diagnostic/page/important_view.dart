import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/diagnostic_detail/view.dart';

class ImportantPage extends StatefulWidget {
  const ImportantPage({super.key});

  @override
  State<ImportantPage> createState() => _ImportantPageState();
}

class _ImportantPageState extends State<ImportantPage> {
  List<bool> _isExpandedList = [false, false, false, false, false];

  List<String> _Notifications = [
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

  List<String> _Time = [
    '06:00,  29/07/2024',
    '06:00,  29/07/2024',
    '06:00,  29/07/2024',
    '06:00,  29/07/2024',
    '06:00,  29/07/2024',
  ];

  List<String> _Title = [
    'Huyết áp',
    'Huyết áp',
    'Huyết áp',
    'Huyết áp',
    'Huyết áp',
  ];

  List<String> _Value = [
    '125/80',
    '125/80',
    '125/80',
    '125/80',
    '125/80',
  ];

  List<String> _Unit = [
    'mg/dL',
    'mg/dL',
    'mg/dL',
    'mg/dL',
    'mg/dL',
  ];

  List<String> _Attachments = [
    '1',
    '2',
    '0',
    '0',
    '3',
    '0',
  ];

  List<bool> _IsAttached = [
    true,
    true,
    false,
    false,
    true,
    false,
  ];

  List<bool> _Important = [
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  void _setImportant(int index) {
    setState(() {
      _Important[index] = !_Important[index];
    });
  }

  void _toggleContainer(int index) {
    setState(() {
      _isExpandedList[index] = !_isExpandedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: List.generate(_isExpandedList.length, (index) {
                return GestureDetector(
                  onTap: () => _toggleContainer(index),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.width,
                    height: _isExpandedList[index]
                        ? _IsAttached[index]
                            ? 190
                            : 168
                        : 104,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.health_and_safety_outlined,
                                    size: 16,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        '•',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    doctors[index],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        '•',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    _Time[index],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: _Important[index]
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .surfaceContainerLow,
                                    size: 16,
                                  )
                                ],
                              ),
                              Icon(
                                _isExpandedList[index]
                                    ? Icons.keyboard_arrow_up_outlined
                                    : Icons.keyboard_arrow_down_outlined,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 20,
                          width: 348,
                          child: Row(
                            children: [
                              Text(
                                'Đã gửi chẩn đoán',
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              SizedBox(
                                width: 16,
                                height: 16,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    '•',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                _Title[index],
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              SizedBox(
                                width: 16,
                                height: 16,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    '•',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                _Value[index] + ' ' + _Unit[index],
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          _Notifications[index],
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        _IsAttached[index]
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 18,
                                        width: 95,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.attach_file_outlined,
                                              size: 18,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            SizedBox(
                                              width: 73,
                                              height: 18,
                                              child: Text(
                                                'Đính kèm (' +
                                                    _Attachments[index] +
                                                    ')',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                ],
                              )
                            : SizedBox(
                                height: 0,
                              ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => DetailView());
                              },
                              child: SizedBox(
                                height: 40,
                                width:
                                    (MediaQuery.of(context).size.width - 64) /
                                        3,
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
                            // const VerticalDivider(
                            //   // width: 0,
                            //   // indent: 0,
                            //   // endIndent: 0,
                            //   thickness: 5,
                            //   color: Colors.black,
                            // ),
                            InkWell(
                              onTap: () {
                                _setImportant(index);
                              },
                              child: SizedBox(
                                height: 40,
                                width:
                                    (MediaQuery.of(context).size.width - 64) /
                                        3,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(
                                      _Important[index]
                                          ? Icons.star
                                          : Icons.star_border_outlined,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Quan trọng',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
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
                                    (MediaQuery.of(context).size.width - 64) /
                                        3,
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
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
