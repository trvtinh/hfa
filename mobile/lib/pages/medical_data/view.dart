import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/medical_data/controller.dart';
import 'package:health_for_all/pages/medical_data/widget/more_data.dart';

class MedicalDataPage extends GetView<MedicalDataController> {
  MedicalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thêm dữ liệu y tế',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Theme.of(context).colorScheme.outline,
            height: 0.7,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                _buildDateTimeField(context, 'Ngày', Icons.event_note,
                    controller.selectDate, controller.dateController,
                    width: MediaQuery.of(context).size.width / 5 * 3),
                _buildDateTimeField(context, 'Thời gian', Icons.schedule,
                    controller.selectTime, controller.timeController,
                    width: MediaQuery.of(context).size.width / 5 * 2),
              ],
            ),
            _buildSearchField(context),
            const Divider(height: 1),
            ...controller.entries,
            const MoreData(),
            const Divider(height: 1),
            _buildActionButtons(context),
            const Divider(height: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildDateTimeField(
      BuildContext context,
      String label,
      IconData icon,
      Future<void> Function(BuildContext) onTap,
      TextEditingController controller,
      {required double width}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        readOnly: true,
        onTap: () => onTap(context),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.surfaceContainer,
      height: 72,
      child: Center(
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: "Input Text",
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search,
                color: Theme.of(context).colorScheme.onSurfaceVariant),
            suffixIcon: Icon(Icons.clear,
                color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(context, "Hủy"),
            const SizedBox(width: 15),
            const VerticalDivider(width: 1, indent: 5, endIndent: 5),
            const SizedBox(width: 15),
            _buildActionButton(context, "Lưu"),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String label) {
    return Container(
      height: 40,
      width: (MediaQuery.of(context).size.width / 2) - 40,
      child: TextButton(
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
