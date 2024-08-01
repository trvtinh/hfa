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