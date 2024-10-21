import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/item.dart';
import 'package:health_for_all/common/entities/user.dart';
import 'package:health_for_all/pages/alarm/controller.dart';
import 'package:health_for_all/pages/notification/controller.dart';
import 'package:health_for_all/pages/profile/controller.dart';

class AddAlarm extends StatefulWidget {
  final String userId;
  final List<String> relativesIds;
  const AddAlarm({super.key, required this.userId, required this.relativesIds});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  final alarmController = Get.find<AlarmController>();
  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width - 32,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/warning_add.png",
                width: 32,
                height: 32,
              ),
              const SizedBox(
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

  Widget myTextField(String name, String hint, TextEditingController controller,
      {bool? readOnly}) {
    return SizedBox(
      child: TextField(
        controller: controller,
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          labelText: name,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.outline,
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        // drop(),
        dropRelatives(),
        const SizedBox(
          height: 24,
        ),
        // drop(),
        drop_alt(),
        const SizedBox(
          height: 24,
        ),
        myTextField(
          "Đơn vị",
          "Đơn vị",
          alarmController.unitController,
          readOnly: true,
        ),
        const SizedBox(
          height: 24,
        ),
        myTextField(
          "Ngưỡng cao",
          "Ngưỡng cao",
          alarmController.highThresholdController,
        ),
        const SizedBox(
          height: 24,
        ),
        myTextField(
          "Ngưỡng thấp",
          "Ngưỡng thấp",
          alarmController.lowThresholdController,
        ),
        const SizedBox(
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
              onPressed: () {
                alarmController.clearData();
                Get.back();
              },
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
              onPressed: () {
                alarmController.addAlarm(context, widget.userId);
              },
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

  Widget drop() {
    String? mySelection;
    final List<Map> medData = getMedData();
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          isDense: true,
          hint: const Text("Chọn loại dữ liệu"),
          value: mySelection,
          onChanged: (newValue) {
            setState(() {
              mySelection = newValue;
            });
          },
          items: medData.map((Map map) {
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

  final List<String> list = List.generate(
      10,
      (index) =>
          Item.getTitle(index)); // Use Item.getTitle to populate the list
  final List<String> listRelatives = [];

  Widget dropRelatives() {
    return StreamBuilder(
      stream: profileController.getUserByIds(widget.relativesIds),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Chưa có người nhà!'));
        } else if (snapshot.hasData) {
          final relatives = snapshot.data ?? [];
          if (relatives.isEmpty) {
            return const Center(child: Text("Chưa có người nhà"));
          }
          return DropdownMenu(
            width: MediaQuery.of(context).size.width - 70,
            hintText: "Chọn người nhà",
            onSelected: (String? value) {
              alarmController.selectedRelative.value = value!;
              log(alarmController.selectedRelative.value);
            },
            dropdownMenuEntries:
                relatives.map<DropdownMenuEntry<String>>((UserData value) {
              return DropdownMenuEntry<String>(
                  value: value.id!, label: value.name!);
            }).toList(),
          );
        } else {
          return const Center(child: Text("Chưa có bệnh nhân"));
        }
      },
    );
  }

  Widget drop_alt() {
    return DropdownMenu(
      width: MediaQuery.of(context).size.width - 70,
      hintText: "Chọn loại dữ liệu",
      onSelected: (String? value) {
        alarmController.seletedTypeId.value = list.indexOf(value!).toString();
        log(alarmController.seletedTypeId.value);
        alarmController.unitController.text = Item.getUnit(list.indexOf(value));
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }

  List<Map> getMedData() {
    return List.generate(10, (index) {
      return {
        "id": index,
        "image": Item.getIconPath(index),
        "name": Item.getTitle(index),
        "unit": Item.getUnit(index),
      };
    });
  }

  // List<Map> MedData = getMedData();
}
