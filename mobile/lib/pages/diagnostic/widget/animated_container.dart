import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/diagnostic_detail/view.dart';

class animatedcontainer extends StatelessWidget {
  final String doctor;
  final String time;
  final String title;
  final String value;
  final String unit;
  final String notification;
  late RxBool isImportant;
  final String attachments;
  final bool isAttached;
  late RxBool isExpanded;
  final int index;
  // final VoidCallback onTapImportant;
  // final VoidCallback onTapDetail;

  animatedcontainer({
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
    required this.isExpanded,
    required this.index,
    // required this.onTapImportant,
    // required this.onTapDetail,
  });

  void _setImportant() {
    isImportant.value = !isImportant.value;
  }

  void _toggleContainer() {
    isExpanded.value = !isExpanded.value;
    // isExpanded = true;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          _toggleContainer();
        },
        child: IntrinsicHeight(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
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
                          doctor,
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 12,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Icon(
                          Icons.star,
                          color: isImportant.value
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerLow,
                          size: 16,
                        ),
                      ],
                    ),
                    Icon(
                      isExpanded.value
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
                      title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$value $unit',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                isExpanded.value == true
                    ? SizedBox(
                        child: Column(
                          children: [
                            Text(
                              notification,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            if (isAttached)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.attach_file_outlined,
                                      size: 18,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Đính kèm ($attachments)',
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
                                    width: (MediaQuery.of(context).size.width -
                                            64) /
                                        3,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Chi tiết',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    log('ontap');
                                    _setImportant();
                                  },
                                  child: SizedBox(
                                    height: 40,
                                    width: (MediaQuery.of(context).size.width -
                                            64) /
                                        3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          isImportant.value
                                              ? Icons.star
                                              : Icons.star_border_outlined,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 8),
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
                                    width: (MediaQuery.of(context).size.width -
                                            64) /
                                        3,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Đã đọc',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'thêm ...',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
