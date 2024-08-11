import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/pages/medical_data/controller.dart';
import 'package:health_for_all/pages/medical_data/widget/combo_box.dart';
import 'package:health_for_all/pages/medical_data/widget/more_data.dart';

class MedicalDataPage extends GetView<MedicalDataController> {
  MedicalDataPage({super.key});

<<<<<<<<< Temporary merge branch 1
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

=========
>>>>>>>>> Temporary merge branch 2
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
<<<<<<<<< Temporary merge branch 1
                _buildDateTimeField(context, 'Ngày', Icons.event_note, _selectDate, width: MediaQuery.of(context).size.width / 3 * 2),
                _buildDateTimeField(context, 'Thời gian', Icons.schedule, _selectTime, width: MediaQuery.of(context).size.width / 3),
=========
                _buildDateTimeField(context, 'Ngày', Icons.event_note,
                    controller.selectDate, controller.dateController,
                    width: MediaQuery.of(context).size.width / 5 * 3),
                _buildDateTimeField(context, 'Thời gian', Icons.schedule,
                    controller.selectTime, controller.timeController,
                    width: MediaQuery.of(context).size.width / 5 * 2),
>>>>>>>>> Temporary merge branch 2
              ],
            ),
            _buildSearchField(context),
            const Divider(height: 1),
            ...entries,
            const MoreData(),
            const Divider(height: 1),
            _buildActionButtons(context),
            const Divider(height: 1),
          ],
        ),
      ),
    );
  }

<<<<<<<<< Temporary merge branch 1
  Widget _buildDateTimeField(BuildContext context, String label, IconData icon, Future<void> Function() onTap, {required double width}) {
=========
  Widget _buildDateTimeField(
      BuildContext context,
      String label,
      IconData icon,
      Future<void> Function(BuildContext) onTap,
      TextEditingController controller,
      {required double width}) {
>>>>>>>>> Temporary merge branch 2
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
    return SizedBox(
      height: 40,
      width: (MediaQuery.of(context).size.width / 2) - 40,
      child: TextButton(
        onPressed: () async {
          if (label == 'Lưu') {
            try {
              // Perform the saving operation
              for (var value in controller.state.data.values) {
                if (value.imagePaths != null) {
                  for (var path in value.imagePaths!) {
                    final imageUrl =
                        await FirebaseApi.uploadImage(path, 'medicalData');
                    value.imageUrls?.add(imageUrl!);
                  }
                }
                log(value.toString());
                await FirebaseApi.addDocument(
                    'medicalData', value.toFirestoreMap());
              }

              // Clear the data after saving
              controller.state.data.clear();

              // Show success dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Thành công'),
                    content: Text('Dữ liệu đã được ghi nhận'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Dismiss the dialog
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } catch (e) {
              // Handle any errors
              print('Error saving data: $e');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Error'),
                    content: Text(
                        'An error occurred while saving data. Please try again.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Dismiss the dialog
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          }
        },
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