import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/medical_data/widget/add_file.dart';
import 'package:intl/intl.dart';

class EditPrescription extends StatefulWidget {
  const EditPrescription({super.key});

  @override
  State<EditPrescription> createState() => _EditPrescriptionState();
}

class _EditPrescriptionState extends State<EditPrescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12,
          ),
          header(),
          SizedBox(
            height: 24,
          ),
          name(),
          SizedBox(
            height: 24,
          ),
          med_list(),
          SizedBox(
            height: 24,
          ),
          choose_date(),
          SizedBox(
            height: 24,
          ),
          AddFile(),
          SizedBox(
            height: 24,
          ),
          _buildDialogTextField('Ghi chú', 'Ghi chú', TextEditingController()),
          SizedBox(
            height: 55,
          ),
          build_button(),
        ],
      ),
    );
  }

  Widget header() {
    return Row(
      children: [
        Icon(
          Icons.medication_liquid,
          size: 32,
          color: Theme.of(context).colorScheme.primary,
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          "Sửa đơn thuốc",
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  final controller = TextEditingController();
  Widget name() {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text("Tên đơn thuốc"),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          )),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget med_list() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Danh sách thuốc",
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                choose_med(),
                SizedBox(
                  height: 12,
                ),
                choose_med(),
              ],
            ),
          )
        ],
      ),
    );
  }

  String dropdownValue = 'Vitamin C';
  List<String> list = <String>['Vitamin C'];
  Widget choose_med() {
    return Container(
      child: Row(
        children: [
          DropdownMenu(
            width: (MediaQuery.of(context).size.width - 95) / 6 * 3.7,
            initialSelection: dropdownValue,
            onSelected: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownMenuEntries:
                list.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 95) / 6 * 1.4,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1,
                )),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: (){},
            child: Icon(
              Icons.clear,
              size: 24,
              color: Theme.of(context).colorScheme.error,
            ),
          )
        ],
      ),
    );
  }

  Widget choose_date() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDateTimeField(
          context,
          'Bắt đầu',
          Icons.today,
          selectDate,
          TextEditingController(),
          width: (MediaQuery.of(context).size.width - 70) / 2 - 5,
        ),
        SizedBox(
          width: 12,
        ),
        _buildDateTimeField(
          context,
          'Kết thúc',
          Icons.today,
          selectDate,
          TextEditingController(),
          width: (MediaQuery.of(context).size.width - 70) / 2 - 5,
        ),
      ],
    );
  }

  final dateController = TextEditingController();
  DateTime datetime = DateTime.now();

  // Replace this with your actual method to select date
  Future<void> selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: datetime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      datetime = selectedDate;
      final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      dateController.text = formattedDate;
    }
  }

  Widget _buildDateTimeField(
      BuildContext context,
      String label,
      IconData icon,
      Future<void> Function(BuildContext) onTap,
      TextEditingController controller,
      {required double width}) {
    return Container(
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
        onTap: () => onTap(context),
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

  Widget build_button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () async{
            Get.back();
          },
          child: Text(
            'Đóng',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(width: 16),
        TextButton(
          onPressed: () async{
            Get.back();
          },
          child: Text(
            'Xóa',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
        const SizedBox(width: 16),
        TextButton(
          onPressed: () async{
            Get.back();
          },
          child: Text(
            'Xác nhận',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}