import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAlarm extends StatefulWidget {
  const EditAlarm({super.key});

  @override
  State<EditAlarm> createState() => _EditAlarmState();
}

class _EditAlarmState extends State<EditAlarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 32,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/warning_amber.png",
                width: 32,
                height: 32,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Sửa cảnh báo",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          body(),
        ],
      ),
    );
  }

  Widget MyTextField(
      String name, String hint, TextEditingController controller) {
    return SizedBox(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: name,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.outline,
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        // drop(),
        drop_alt(),
        SizedBox(
          height: 24,
        ),
        MyTextField("Đơn vị", "Đơn vị", TextEditingController()),
        SizedBox(
          height: 24,
        ),
        MyTextField("Ngưỡng cao", "Ngưỡng cao", TextEditingController()),
        SizedBox(
          height: 24,
        ),
        MyTextField("Ngưỡng thấp", "Ngưỡng thấp", TextEditingController()),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              onPressed: (){Get.back();},
              child: Text(
                "Đóng",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              onPressed: (){Get.back();},
              child: Text(
                "Xóa",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              onPressed: (){Get.back();},
              child: Text(
                "Xác nhận",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String dropdownValue = 'Loại dữ liệu';

  List<String> list = <String>[
    'Loại dữ liệu',
    'Huyết áp',
    'Thân nhiệt',
    'Đường huyết',
    'Nhịp tim',
    'SPO2',
    'HRV',
    'ECG - Điện tâm đồ',
    'Cân nặng',
    'Xét nghiệm máu',
    'Axit Uric',
  ];

  Widget drop_alt() {
    return DropdownMenu(
      width: MediaQuery.sizeOf(context).width - 32,
      initialSelection: dropdownValue,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }

  Widget drop() {
    String? _mySelection;
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          isDense: true,
          hint: const Text("Chọn loại dữ liệu"),
          value: _mySelection,
          onChanged: (newValue) {
            setState(() {
              _mySelection = newValue;
            });
          },
          items: MedData.map((Map map) {
            return DropdownMenuItem<String>(
              value: map["name"].toString(),
              child: Row(
                children: [
                  Image.asset(
                    map["image"],
                    width: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(map["name"].toString()),
                  ),
                ],
              ),
            );
          }).toList(), // Convert the Iterable to a List
        ),
      ),
    );
  }

  List<Map> MedData = [
    {
      "id": 1,
      "image": 'assets/medical_data_Home_images/blood-pressure.png',
      "name": 'Huyết áp'
    },
    {
      "id": 2,
      "image": 'assets/medical_data_Home_images/thermometer.png',
      "name": 'Thân nhiệt'
    },
    {
      "id": 3,
      "image": 'assets/medical_data_Home_images/blood sugar.png',
      "name": 'Đường huyết'
    },
    {
      "id": 4,
      "image": 'assets/medical_data_Home_images/heart-rate.png',
      "name": 'Nhịp tim'
    },
    {
      "id": 5,
      "image": 'assets/medical_data_Home_images/spo2.png',
      "name": 'SPO2'
    },
    {
      "id": 6,
      "image": 'assets/medical_data_Home_images/favorite_border.png',
      "name": 'HRV'
    },
    {
      "id": 7,
      "image": 'assets/medical_data_Home_images/ecg-outline.png',
      "name": 'ECG - Điện tâm đồ'
    },
    {
      "id": 8,
      "image": 'assets/medical_data_Home_images/scale.png',
      "name": 'Cân nặng'
    },
    {
      "id": 9,
      "image": 'assets/medical_data_Home_images/result.png',
      "name": 'Xét nghiệm máu'
    },
    {
      "id": 10,
      "image": 'assets/medical_data_Home_images/Axit Uric.png',
      "name": 'Axit Uric'
    },
  ];
}