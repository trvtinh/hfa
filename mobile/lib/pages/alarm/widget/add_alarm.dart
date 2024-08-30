import 'package:flutter/material.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  List<String> list = <String>[
    "Huyết áp",
    "Cân nặng",
  ];
  String dropdownValue = 'Loại dữ liệu';

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
                "assets/images/warning_add.png",
                width: 32,
                height: 32,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Thêm cảnh báo",
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
        DropdownMenu(
          label: Text("Loại dữ liệu sức khỏe"),
          width: MediaQuery.sizeOf(context).width,
          initialSelection: dropdownValue,
          onSelected: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
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
      ],
    );
  }
}
