import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/item.dart';
import 'package:health_for_all/common/entities/prescription.dart';
import 'package:health_for_all/pages/reminder/controller.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class AddReminder extends StatefulWidget {
  const AddReminder({super.key});

  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  final ReminderController reminderController = Get.put(ReminderController());

  @override
  Widget build(BuildContext context) {
    reminderController.initPrescriptions();
    reminderController.fetchPrescriptions();
    reminderController.fetchMedicalData();
    return SizedBox(
      width: MediaQuery.sizeOf(context).width - 32,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Icon(
                Icons.edit_calendar_outlined,
                size: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                "Thêm nhắc nhở",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          body(),
        ],
      ),
    );
  }

  Widget MyTextField(
      String name, String hint, TextEditingController controller) {
    return SizedBox(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: name,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.outline,
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          date_time(),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              for (int i = 0; i < 4; i++) choice(i),
            ],
          ),
          Row(
            children: [
              for (int i = 4; i < 7; i++) choice(i),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          _buildDialogTextField("Tên nhắc nhở", "Tên nhăc nhở",
              reminderController.nameController),
          const SizedBox(
            height: 24,
          ),
          drop_alt1(),
          const SizedBox(
            height: 24,
          ),
          drop_alt2(),
          const SizedBox(
            height: 24,
          ),
          _buildDialogTextField(
              "Mô tả", "Mô tả", reminderController.noteController),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                onPressed: () {
                  reminderController.clearData();
                  Get.back();
                },
                child: Text(
                  "Đóng",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Xác nhận",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDialogTextField(
      String label, String hint, TextEditingController controller,
      {IconData? icon}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.outline,
          fontSize: 16,
        ),
        border: const OutlineInputBorder(),
        prefixIcon: icon != null
            ? Icon(icon, color: Theme.of(context).colorScheme.primary)
            : null,
      ),
    );
  }

  Widget choice(int index) {
    bool isSelected = reminderController.onDate[index];

    return Row(
      children: [
        SizedBox(
          width: 4,
        ),
        SizedBox(
          width: (MediaQuery.sizeOf(context).width - 3) / 5,
          child: ChoiceChip(
            label: Text(
              reminderController.nameDate[index],
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            selected: isSelected,
            selectedColor: Theme.of(context).colorScheme.secondaryContainer,
            onSelected: (bool selected) {
              setState(() {
                reminderController.onDate[index] =
                    !reminderController.onDate[index];
              });
            },
          ),
        ),
      ],
    );
  }

  Widget date_time() {
    return Container(
      child: Row(
        children: [
          _buildDateTimeField(
            context,
            'Thời gian',
            Icons.today,
            reminderController.timeController,
            width: (MediaQuery.of(context).size.width - 80) / 2,
          ),
          const SizedBox(
            width: 12,
          ),
          _buildDateTimeField(
            context,
            'Ngày hết hạn',
            Icons.today,
            reminderController.dueDateController,
            width: (MediaQuery.of(context).size.width - 80) / 2,
          ),
        ],
      ),
    );
  }

  DateTime datetime = DateTime.now();

  // Replace this with your actual method to select date
  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: datetime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        datetime = selectedDate;
        final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
        controller.text = formattedDate; // Update the respective controller
      });
    }
  }

  Widget _buildDateTimeField(BuildContext context, String label, IconData icon,
      TextEditingController controller,
      {required double width}) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon:
              Icon(icon, color: Theme.of(context).colorScheme.onSurfaceVariant),
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        readOnly: true,
        onTap: () =>
            selectDate(context, controller), // Pass the controller here
      ),
    );
  }

  Widget drop_alt1() {
    return Obx(() => reminderController.prescriptionList.isEmpty
        ? Center(
            child:
                CircularProgressIndicator()) // Loading indicator while fetching
        : Column(
            children: [
              MultiSelectDialogField(
                items: reminderController.prescriptionList
                    .map((prescription) => MultiSelectItem<Prescription>(
                        prescription,
                        prescription.name ?? 'Đơn thuốc không tên'))
                    .toList(),
                title: Text("Chọn đơn thuốc"),
                selectedColor: Colors.blue,
                buttonText: Text(
                  reminderController.selectedPrescriptions.isEmpty
                      ? "Chưa có đơn thuốc nào được chọn"
                      : "${reminderController.selectedPrescriptions.length} đơn thuốc đã được chọn",
                ),
                onConfirm: (values) {
                  reminderController.selectedPrescriptions
                      .assignAll(values.cast<Prescription>());
                  // No need to use setState or .obs here
                },
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ],
          ));
  }

  Widget drop_alt2() {
    return Obx(() => reminderController.medDataList.isEmpty
        ? Center(
            child:
                CircularProgressIndicator()) // Loading indicator while fetching
        : Column(
            children: [
              MultiSelectDialogField(
                items: reminderController.medDataList
                    .map((med) => MultiSelectItem<int>(med, Item.getTitle(med)))
                    .toList(),
                title: Text("Chọn loại dữ liệu y tế"),
                selectedColor: Colors.blue,
                buttonText: Text(
                  reminderController.selectedPrescriptions.isEmpty
                      ? "Chưa có dữ liệu y tế nào được chọn"
                      : "${reminderController.selectedMedData.length} dữ liệu y tế đã được chọn",
                ),
                onConfirm: (values) {
                  setState(() {
                    reminderController.selectedMedData = values.cast<int>().obs;
                  });
                },
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ],
          ));
  }
}
