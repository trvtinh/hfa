import 'package:custom_calendar_viewer/custom_calendar_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/overall_medical_data_history/controller.dart';
import 'package:health_for_all/pages/overall_medical_data_history/widget/add_choice.dart';
import 'package:health_for_all/pages/overall_medical_data_history/widget/combo_box.dart';
import 'package:intl/intl.dart';

class OverallMedicalDataHistoryPage extends GetView<OverallMedicalDataHistoryController>{
  RxString formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  @override
  Widget build(BuildContext context){
    Future<void> _selectDate() async {
      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (selectedDate != null) {
        // Format the date as a string
        formattedDate.value = DateFormat('dd/MM/yyyy').format(selectedDate);
        print('Selected Date: $formattedDate');
        // You can use the formattedDate string as needed
      } else {
        print('Date selection was canceled');
      }
    }
    Widget _buildDivider() => Divider(height: 1);

    Widget _buildDateRow() {
      return Container(
        height: 60,
        padding: EdgeInsets.all(16),
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
          children: [
            Icon(Icons.calendar_month, color: Theme.of(context).colorScheme.secondary),
            const SizedBox(width: 10),
            Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.secondary),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.calendar_month, color: Theme.of(context).colorScheme.secondary),
                            title: Obx(() => Text(formattedDate.value, style: TextStyle(fontSize: 22, color: Theme.of(context).colorScheme.secondary))),
                            trailing: Text(
                              "Hôm nay",
                              style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                          CustomCalendarViewer(
                            calendarType: CustomCalendarType.viewFullYear,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Obx(() => Text(formattedDate.value, style: TextStyle(fontSize: 22, color: Theme.of(context).colorScheme.secondary))),
            ),
            Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.secondary),
            Spacer(),
            GestureDetector(
              onTap: (){
                showModalBottomSheet(
                  context: context, 
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor, // Match the container's color to the theme
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.filter_list),
                            title: Text(
                              'Loại dữ liệu hiển thị',
                              style: TextStyle(
                                fontSize: 22,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            trailing: Text(
                              "Mặc định",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Divider(height: 1,),
                                SizedBox(height: 16,),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Theme.of(context).colorScheme.surfaceContainer,
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      hintText: "Tìm kiếm",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).colorScheme.onSurfaceVariant
                                      )
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    AddChoice(name: "Huyết áp"),
                                    const SizedBox(width: 6,),
                                    AddChoice(name: "Thân nhiệt"),
                                    const SizedBox(width: 6,),
                                    AddChoice(name: "Đường huyết"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    AddChoice(name: "Nhịp tim"),
                                    const SizedBox(width: 6,),
                                    AddChoice(name: "SPO2"),
                                    const SizedBox(width: 6,),
                                    AddChoice(name: "HRV"),
                                    const SizedBox(width: 6,),
                                    AddChoice(name: "ECG"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    AddChoice(name: "Cân nặng"),
                                    const SizedBox(width: 2,),
                                    AddChoice(name: "Axit Uric"),
                                    const SizedBox(width: 2,),
                                    AddChoice(name: "Phiếu xét nghiệm"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    AddChoice(name: "Kết quả khám"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                );
              },
              child: Icon(Icons.filter_alt, color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      );
    }

    final List<Map<String, String>> comboBoxItems = [
      {'leadingiconpath': 'assets/images/huyet_ap.png', 'title': "Huyết áp", 'value': "120/80", 'unit': "mmHg"},
      {'leadingiconpath': 'assets/images/than_nhiet.png', 'title': "Thân nhiệt", 'value': "36", 'unit': "°C"},
      {'leadingiconpath': 'assets/images/duong_huyet.png', 'title': "Đường huyết", 'value': "80", 'unit': "mg/dL"},
      {'leadingiconpath': 'assets/images/nhip_tim.png', 'title': "Nhịp tim", 'value': "80", 'unit': "lần/phút"},
      {'leadingiconpath': 'assets/images/spo2.png', 'title': "SPO2", 'value': "--", 'unit': "%"},
      {'leadingiconpath': 'assets/images/hrv.png', 'title': "HRV", 'value': "--", 'unit': "ms"},
      {'leadingiconpath': 'assets/images/ecg.png', 'title': "ECG - Điện tâm đồ", 'value': "--", 'unit': "--"},
      {'leadingiconpath': 'assets/images/can_nang.png', 'title': "Cân nặng", 'value': "--", 'unit': "kg"},
      {'leadingiconpath': 'assets/images/xet_nghiem_mau.png', 'title': "Xét nghiệm máu", 'value': "--", 'unit': "--"},
      {'leadingiconpath': 'assets/images/axit_uric.png', 'title': "Axit Uric", 'value': "--", 'unit': "--"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử dữ liệu y tế'),
        actions: [
          IconButton(icon: const Icon(Icons.list), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildDivider(),
            _buildDateRow(),
            _buildDivider(),
            ...comboBoxItems.map((item) => Column(
              children: [
                ComboBox(
                  leadingiconpath: item['leadingiconpath']!,
                  time: "09:00",
                  title: item['title']!,
                  value: item['value']!,
                  unit: item['unit']!,
                ),
                _buildDivider(),
              ],
            )).toList(),
          ],
        ),
      ),
    );
  }
}
