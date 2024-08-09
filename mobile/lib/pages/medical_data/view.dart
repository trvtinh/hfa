import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/medical_data/controller.dart';
import 'package:health_for_all/pages/medical_data/widget/combo_box.dart';

class MedicalDataPage extends GetView<MedicalDataController> {
  MedicalDataPage({super.key});

  final infor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate() async {
      await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
    }

    TimeOfDay _timeofDay = TimeOfDay.now();
    Future<void> _selectTime() async {
      await showTimePicker(
        initialTime: _timeofDay,
        context: context,
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
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ngày tháng năm
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width / 3 * 2,
                  child: TextField(
                    controller: infor,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(0),
                        child: Icon(
                          Icons.event_note,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Ngày',
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextField(
                    controller: infor,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(0),
                        child: Icon(
                          Icons.schedule,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Thời gian',
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectTime();
                    },
                  ),
                ),
              ],
            ),

            // thanh tìm kiếm
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              height: 72,
              child: Center(
                child: TextField(
                  controller: infor,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: "Input Text",
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                        Icons.clear,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Chỉ số
            ComboBox(
              leadingiconpath: 'assets/images/huyet_ap.png',
              title: "Huyết áp",
              value: "120/80",
              unit: "mmHg",
            ),
            Divider(
              height: 1,
            ),
            ComboBox(
              leadingiconpath: 'assets/images/than_nhiet.png',
              title: "Thân nhiệt",
              value: "36",
              unit: "°C",
            ),
            Divider(
              height: 1,
            ),
            ComboBox(
              leadingiconpath: 'assets/images/duong_huyet.png',
              title: "Đường huyết",
              value: "80",
              unit: "mg/dL",
            ),
            Divider(
              height: 1,
            ),
            ComboBox(
              leadingiconpath: 'assets/images/nhip_tim.png',
              title: "Nhịp tim",
              value: "80",
              unit: "lần/phút",
            ),
            Divider(
              height: 1,
            ),
            ComboBox(
              leadingiconpath: 'assets/images/spo2.png',
              title: "SPO2",
              value: "--",
              unit: "%",
            ),
            Divider(
              height: 1,
            ),
            ComboBox(
              leadingiconpath: 'assets/images/hrv.png',
              title: "HRV",
              value: "--",
              unit: "ms",
            ),
            Divider(
              height: 1,
            ),
            ComboBox(
              leadingiconpath: 'assets/images/ecg.png',
              title: "ECG - Điện tâm đồ",
              value: "--",
              unit: "--",
            ),
            Divider(
              height: 1,
            ),
            ComboBox(
              leadingiconpath: 'assets/images/can_nang.png',
              title: "Cân nặng",
              value: "--",
              unit: "kg",
            ),
            Divider(
              height: 1,
            ),
            ComboBox(
              leadingiconpath: 'assets/images/xet_nghiem_mau.png',
              title: "Xét nghiệm máu",
              value: "--",
              unit: "--",
            ),
            Divider(
              height: 1,
            ),
            ComboBox(
              leadingiconpath: 'assets/images/axit_uric.png',
              title: "Axit Uric",
              value: "--",
              unit: "--",
            ),
            Divider(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
