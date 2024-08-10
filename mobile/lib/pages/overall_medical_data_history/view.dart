import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/overall_medical_data_history/controller.dart';
import 'package:health_for_all/pages/overall_medical_data_history/widget/combo_box.dart';

class OverallMedicalDataHistoryPage extends GetView<OverallMedicalDataHistoryController>{
  @override
  Widget build(BuildContext context){
    Future<void> _selectDate() async {
      await showDatePicker(
        context: context, 
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
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
              onTap: _selectDate,
              child: Text('31/07/2024', style: TextStyle(fontSize: 22, color: Theme.of(context).colorScheme.secondary)),
            ),
            Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.secondary),
            Spacer(),
            GestureDetector(
              onTap: (){
                showModalBottomSheet(
                  context: context, 
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        leading: Icon(Icons.filter_list),
                        title: Text(
                          'Loại dữ liệu hiển thị',
                          style: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              'Mặc định',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      body: Column(
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
