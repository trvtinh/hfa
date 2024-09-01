import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/entities/dianostic.dart';
import 'package:health_for_all/common/helper/datetime_change.dart';
import 'package:health_for_all/pages/overall_medical_data_history/controller.dart';

class DiagnosticScreen extends StatelessWidget {
  DiagnosticScreen({super.key});

  final controller = Get.find<OverallMedicalDataHistoryController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.health_and_safety,
              size: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Obx(() =>
                Text('Chẩn đoán (${controller.state.diagnosticList.length})'))
          ],
        ),
        const SizedBox(height: 10),
        Obx(
          () => Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: const Border(
                    top: BorderSide(color: Colors.grey),
                    bottom: BorderSide(color: Colors.grey),
                  ),
                  color: Theme.of(context).colorScheme.surfaceContainer),
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: controller.state.diagnosticList.length,
                itemBuilder: (context, index) {
                  final dianostic = controller.state.diagnosticList[index];
                  return FutureBuilder<String>(
                    future: controller.getUser(dianostic.userId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final name = snapshot.data ?? 'Unknown';
                        return Column(
                          children: [
                            buildDianosticBox(dianostic, context, name),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            // Get.to(() => DiagnosticScrenn());
          },
          child: Container(
            color: Colors.transparent,
            width: double
                .infinity, // Ensures the container takes the full width of its parent
            child: const Row(
              children: [
                Icon(Icons.add_circle_outline),
                SizedBox(
                  width: 16,
                ),
                Text('Thêm chẩn đoán'),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildDianosticBox(
      Dianostic dianostic, BuildContext context, String name) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.surfaceContainerLowest),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.health_and_safety,
                size: 16,
              ),
              const SizedBox(
                width: 6,
              ),
              const Text("·"),
              const SizedBox(
                width: 6,
              ),
              Text(name),
              const SizedBox(
                width: 6,
              ),
              const Text("·"),
              const SizedBox(
                width: 6,
              ),
              Text(
                '${DatetimeChange.getHourString(dianostic.timestamp.toDate())}, ${DatetimeChange.getDatetimeString(dianostic.timestamp.toDate())}',
                style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              // Spacer(),
              // Obx(() => IconButton(
              //     onPressed: () {
              //       isExpanded.value = !isExpanded.value;
              //     },
              //     icon: isExpanded.value
              //         ? const Icon(Icons.keyboard_arrow_up_rounded)
              //         : const Icon(Icons.keyboard_arrow_down_rounded)))
            ],
          ),
          const Row(
            children: [
              Text('Đã bình luận'),
              SizedBox(
                width: 6,
              ),
              // const Text("·"),
              // const SizedBox(
              //   width: 6,
              // ),
            ],
          ),
          Text(dianostic.content)
        ],
      ),
    );
  }
}
