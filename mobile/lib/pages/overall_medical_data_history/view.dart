import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/overall_medical_data_history/controller.dart';

class OverallMedicalDataHistoryPage extends StatelessWidget {
  OverallMedicalDataHistoryPage({super.key});
  final controller = Get.find<OverallMedicalDataHistoryController>();
  @override
  Widget build(BuildContext context) {
    Future<void> selectDate() async {
      await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
    }

    Future<List<Widget>> buildComboBoxes() async {
      final entries = await controller.getEntries(context);
      return entries
          .map((item) => Column(
                children: [
                  item,
                  const Divider(height: 1),
                ],
              ))
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch sử dữ liệu y tế'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(height: 1),
            Container(
              height: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                border: const Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month,
                            color: Theme.of(context).colorScheme.secondary),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios_new,
                              color: Theme.of(context).colorScheme.secondary),
                          onPressed: () {
                            controller.dateTimeSelected.value = controller
                                .dateTimeSelected.value
                                .subtract(const Duration(days: 1));
                          },
                        ),
                        GestureDetector(
                            onTap: () => controller.selectDate(context),
                            child: Obx(
                              () => Text(
                                controller.dateSelected.value,
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                            )),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios,
                              color: Theme.of(context).colorScheme.secondary),
                          onPressed: () {
                            controller.dateTimeSelected.value = controller
                                .dateTimeSelected.value
                                .add(const Duration(days: 1));
                          },
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Icon(Icons.filter_alt,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              return FutureBuilder(
                future: controller.getEntries(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available'));
                  } else {
                    return Column(children: snapshot.data!);
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
