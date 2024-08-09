import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/medical_data/controller.dart';
import 'package:health_for_all/pages/medical_data/widget/combo_box.dart';
import 'package:health_for_all/pages/medical_data/widget/more_data.dart';

class MedicalDataPage extends GetView<MedicalDataController> {
  MedicalDataPage({super.key});

  final List<ComboBox> entries = [
    ComboBox(leadingiconpath: 'assets/images/huyet_ap.png', title: "Huyết áp", value: "120/80", unit: "mmHg"),
    ComboBox(leadingiconpath: 'assets/images/than_nhiet.png', title: "Thân nhiệt", value: "36", unit: "°C"),
    ComboBox(leadingiconpath: 'assets/images/duong_huyet.png', title: "Đường huyết", value: "80", unit: "mg/dL"),
    ComboBox(leadingiconpath: 'assets/images/nhip_tim.png', title: "Nhịp tim", value: "80", unit: "lần/phút"),
    ComboBox(leadingiconpath: 'assets/images/spo2.png', title: "SPO2", value: "--", unit: "%"),
    ComboBox(leadingiconpath: 'assets/images/hrv.png', title: "HRV", value: "--", unit: "ms"),
    ComboBox(leadingiconpath: 'assets/images/ecg.png', title: "ECG - Điện tâm đồ", value: "--", unit: "--"),
    ComboBox(leadingiconpath: 'assets/images/can_nang.png', title: "Cân nặng", value: "--", unit: "kg"),
    ComboBox(leadingiconpath: 'assets/images/xet_nghiem_mau.png', title: "Xét nghiệm máu", value: "--", unit: "--"),
    ComboBox(leadingiconpath: 'assets/images/axit_uric.png', title: "Axit Uric", value: "--", unit: "--"),
  ];

  final infor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.now();
    TimeOfDay timeOfDay = TimeOfDay.now();

    Future<void> _selectDate() async {
      await showDatePicker(
        context: context,
        initialDate: datetime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
    }

    Future<void> _selectTime() async {
      await showTimePicker(
        context: context,
        initialTime: timeOfDay,
      );
    }

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
                _buildDateTimeField(context, 'Ngày', Icons.event_note, _selectDate, width: MediaQuery.of(context).size.width / 3 * 2),
                _buildDateTimeField(context, 'Thời gian', Icons.schedule, _selectTime, width: MediaQuery.of(context).size.width / 3),
              ],
            ),
            _buildSearchField(context),
            Divider(height: 1),
            ...entries,
            MoreData(),
            Divider(height: 1),
            _buildActionButtons(context),
            Divider(height: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildDateTimeField(BuildContext context, String label, IconData icon, Future<void> Function() onTap, {required double width}) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: width,
      child: TextField(
        controller: infor,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
          border: OutlineInputBorder(),
          labelText: label,
        ),
        readOnly: true,
        onTap: onTap,
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
          controller: infor,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: "Input Text",
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.onSurfaceVariant),
            suffixIcon: Icon(Icons.clear, color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(context, "Hủy"),
            SizedBox(width: 15),
            VerticalDivider(width: 1, indent: 5, endIndent: 5),
            SizedBox(width: 15),
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
