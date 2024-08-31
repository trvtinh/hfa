import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/diagnostic_add/widget/add_file.dart';

class AddTypedMed extends StatefulWidget {
  const AddTypedMed({super.key});

  @override
  State<AddTypedMed> createState() => _AddTypedMedState();
}

class _AddTypedMedState extends State<AddTypedMed> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        header(),
        body(),
        build_button(),
      ],
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
          "Thêm loại thuốc",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 24,
          ),
        ),
      ],
    );
  }

  Widget body() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 24,
      ),
      child: Column(children: [
        _buildDialogTextField("Tên loại thuốc", "Tên loại thuốc"),
        SizedBox(height: 24,),
        _buildDialogTextField("Tên loại thuốc", "Tên loại thuốc"),
        SizedBox(height: 24,),
        AddFile(),
      ]),
    );
  }

  Widget _buildDialogTextField(
    String label,
    String hint,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width-20,
      child: TextField(
        controller: TextEditingController(),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontSize: 16,
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget build_button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () async {
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
          onPressed: () async {
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
