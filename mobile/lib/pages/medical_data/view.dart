import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/medical_data/controller.dart';
import 'package:health_for_all/pages/medical_data/widget/combo_box.dart';
 
class MedicalDataPage extends GetView<MedicalDataController> {
  MedicalDataPage({super.key});
 
  final infor = TextEditingController();
 
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
        )),
      ),
<<<<<<< HEAD
      body: 
          SingleChildScrollView(
            child: Column(
              children: [
                // ngày tháng năm
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.width/3*2,
                      child: TextField(
                        controller: infor,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Icon(
                              Icons.event_note,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'Ngày',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.width/3,
                      child: TextField(
                        controller: infor,
                        
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Icon(
                              Icons.schedule,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'Thời gian',
                        ),
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
                      decoration: InputDecoration(
                        hintText: "Input Text",
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Icon(
                            Icons.search,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Icon(
                            Icons.clear,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ), 
=======
      body: Column(
        children: [
          // ngày tháng năm
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width/3*2,
                child: TextField(
                  controller: infor,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                        Icons.event_note,
                        color: Theme.of(context).colorScheme.primary,
>>>>>>> parent of dfbd718 (sửa scroll view và thêm các chỉ số)
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Ngày',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width/3,
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
                ),
              ),
            ],
          ),

<<<<<<< HEAD
                // Chỉ số
                const ComboBox(leadingiconpath: 'assets/images/huyet_ap.png', title: "Huyết áp", value: "120/80", unit: "mmHg", check: true),
                const ComboBox(leadingiconpath: 'assets/images/than_nhiet.png', title: "Thân nhiệt", value: "36", unit: "°C", check: true),
                const ComboBox(leadingiconpath: 'assets/images/duong_huyet.png', title: "Đường huyết", value: "80", unit: "mg/dL", check: true),
                const ComboBox(leadingiconpath: 'assets/images/nhip_tim.png', title: "Nhịp tim", value: "80", unit: "lần/phút", check: true),
                const ComboBox(leadingiconpath: 'assets/images/spo2.png', title: "SPO2", value: "--", unit: "%", check: false),
                const ComboBox(leadingiconpath: 'assets/images/hrv.png', title: "HRV", value: "--", unit: "ms", check: false),
                const ComboBox(leadingiconpath: 'assets/images/ecg.png', title: "ECG - Điện tâm đồ", value: "--", unit: "--", check: false),
                const ComboBox(leadingiconpath: 'assets/images/can_nang.png', title: "Cân nặng", value: "--", unit: "kg", check: false),
                const ComboBox(leadingiconpath: 'assets/images/xet_nghiem_mau.png', title: "Xét nghiệm máu", value: "--", unit: "--", check: true),
                const ComboBox(leadingiconpath: 'assets/images/axit_uric.png', title: "Axit Uric", value: "--", unit: "--", check: false),
              ],
=======
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
>>>>>>> parent of dfbd718 (sửa scroll view và thêm các chỉ số)
            ),
          ),
          ComboBox(leadingicon: Icon(Icons.bloodtype), title: "Huyết áp", value: "120/80", unit: "mg/dL", check: true),
          ComboBox(leadingicon: Icon(Icons.bloodtype), title: "Huyết áp", value: "120/80", unit: "mg/dL", check: true),
          ComboBox(leadingicon: Icon(Icons.bloodtype), title: "Huyết áp", value: "120/80", unit: "mg/dL", check: true),
        ],
      ),
    );
  }
}