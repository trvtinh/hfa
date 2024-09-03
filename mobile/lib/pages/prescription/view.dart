import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/prescription/controller.dart';
import 'package:health_for_all/pages/prescription/widget/add_prescription.dart';
import 'package:health_for_all/pages/prescription/widget/filter_sheet.dart';
import 'package:health_for_all/pages/prescription/widget/precription_box.dart';

class PrescriptionPage extends GetView<PrescriptionController> {
  PrescriptionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn thuốc'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              height: 1.2,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  add_prescrition(context),
                  const SizedBox(
                    height: 16,
                  ),
                  filter_prescription(context),
                  const Divider(
                    height: 1.2,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  list_prescription(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget add_prescrition(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Theme.of(context).colorScheme.errorContainer,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              spreadRadius: 0.6,
              blurRadius: 2,
              // offset: Offset(0, 3), // changes position of shadow
            )
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(
              Icons.add_circle_outline,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Thêm mới đơn thuốc",
              style: TextStyle(
                fontSize: 22,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget filter_prescription(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Danh sách đơn thuốc (4)",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 14,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              bottom_sheet(context);
            },
            icon: Icon(
              Icons.filter_list,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }

  void bottom_sheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      context: context,
      builder: (ctx) => const FilterSheet(),
    );
  }

  Widget list_prescription() {
    return const Column(
      children: [
        PrescriptionBox(
          name: "Đơn thuốc 1",
          num_type: 3,
          num_tablet: 5,
          start_date: "2024/08/11",
          end_date: "2024/09/30",
          order: 1,
        ),
        PrescriptionBox(
          name: "ĐT Gout cấp tính",
          num_type: 3,
          num_tablet: 5,
          start_date: "2024/08/11",
          end_date: "2024/09/30",
          order: 2,
        ),
        PrescriptionBox(
          name: "Đơn thuốc 3",
          num_type: 3,
          num_tablet: 5,
          start_date: "2024/08/11",
          end_date: "2024/09/30",
          order: 3,
        ),
        PrescriptionBox(
          name: "Đơn thuốc 6",
          num_type: 3,
          num_tablet: 5,
          start_date: "2024/08/11",
          end_date: "2024/09/30",
          order: 4,
        ),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          insetPadding: const EdgeInsets.all(10),
          content: SizedBox(
            width: MediaQuery.of(context).size.width - 70,
            child: const SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: AddPrescription()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
