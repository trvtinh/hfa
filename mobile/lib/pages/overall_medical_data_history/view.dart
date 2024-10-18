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
    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử dữ liệu y tế'),
        actions: [
          Container(padding: const EdgeInsets.symmetric(horizontal: 10), child: const Icon(Icons.list)),
          Container(padding: const EdgeInsets.symmetric(horizontal: 10), child: const Icon(Icons.more_vert)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(height: 1,),
            // Chọn ngày và lọc
            Container(
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
              child: Row(children: [
                Expanded(
                  child: Row(children: [
                    Icon(
                      Icons.calendar_month,
                      color: Theme.of(context).colorScheme.secondary, 
                    ),
                    const SizedBox(width: 10,),
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: Theme.of(context).colorScheme.secondary, 
                      ),
                    GestureDetector(
                      onTap: (){
                        _selectDate();
                      },
                      child: Text(
                        '31/07/2024',
                        style: TextStyle(
                          fontSize: 22,
                          color: Theme.of(context).colorScheme.secondary, 
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).colorScheme.secondary,   
                    ),
                  ],)
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: Icon(
                      Icons.filter_alt,
                      color: Theme.of(context).colorScheme.secondary, 
                    ),
                  ),
                )
              ],),
            ),
            //Chỉ số
            ComboBox(leadingiconpath: 'assets/images/huyet_ap.png', time: "09:00", title: "Huyết áp", value: "120/80", unit: "mmHg"),
            Divider(height: 1,),
            ComboBox(leadingiconpath: 'assets/images/than_nhiet.png', time: "09:00", title: "Thân nhiệt", value: "36", unit: "°C"),
            Divider(height: 1,),
            ComboBox(leadingiconpath: 'assets/images/duong_huyet.png', time: "09:00", title: "Đường huyết", value: "80", unit: "mg/dL"),
            Divider(height: 1,),
            ComboBox(leadingiconpath: 'assets/images/nhip_tim.png', time: "09:00", title: "Nhịp tim", value: "80", unit: "lần/phút"),
            Divider(height: 1,),
            ComboBox(leadingiconpath: 'assets/images/spo2.png', time: "09:00", title: "SPO2", value: "--", unit: "%"),
            Divider(height: 1,),
            ComboBox(leadingiconpath: 'assets/images/hrv.png', time: "09:00", title: "HRV", value: "--", unit: "ms"),
            Divider(height: 1,),
            ComboBox(leadingiconpath: 'assets/images/ecg.png', time: "09:00", title: "ECG - Điện tâm đồ", value: "--", unit: "--"),
            Divider(height: 1,),
            ComboBox(leadingiconpath: 'assets/images/can_nang.png', time: "09:00", title: "Cân nặng", value: "--", unit: "kg"),
            Divider(height: 1,),
            ComboBox(leadingiconpath: 'assets/images/xet_nghiem_mau.png', time: "09:00", title: "Xét nghiệm máu", value: "--", unit: "--"),
            Divider(height: 1,),
            ComboBox(leadingiconpath: 'assets/images/axit_uric.png', time: "09:00", title: "Axit Uric", value: "--", unit: "--"),
            Divider(height: 1,),
          ],
        ),
      ),
    );
  }
}