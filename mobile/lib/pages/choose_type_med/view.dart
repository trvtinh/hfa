import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/choose_type_med/widget/add_typed_med.dart';
import 'package:health_for_all/pages/choose_type_med/widget/edit_typed_med.dart';

class ChooseTypeMed extends StatefulWidget {
  const ChooseTypeMed({super.key});

  @override
  State<ChooseTypeMed> createState() => _ChooseTypeMedState();
}

class _ChooseTypeMedState extends State<ChooseTypeMed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chọn loại thuốc",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        actions: [
          Icon(
            Icons.help_outline,
            size: 24,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Divider(
                    height: 1,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        add_type_med(),
                        SizedBox(
                          height: 16,
                        ),
                        head_list(),
                        SizedBox(
                          height: 12,
                        ),
                        for (int i = 0; i < num_type; i++) type_med(i),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: OutlinedButton(
              onPressed: (){},
              child: Container(
                width: MediaQuery.of(context).size.width-81,
                child: Center(
                  child: Text(
                    "Xem thêm " + (num_type - 4).toString() + " loại thuốc",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: (){
                  Get.back();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/2-75,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Center(
                    child: Text(
                      "Hủy",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),  
              SizedBox(width: 10,),
              VerticalDivider(width: 1, thickness: 1, color: Colors.black,),
              SizedBox(width: 10,),
              OutlinedButton(
                onPressed: (){
                  Get.back();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/2-75,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Center(
                    child: Text(
                      "Xác nhận",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }

  int num_type = 4;

  List<String> med = [
    "Vitamin C 500mg",
    "Paracetamol 500mg",
    "Simvastatin 500mg",
    "Omeprazole 500mg",
    "Metformin 500mg",
  ];

  List<bool> choose = [
    true,
    false,
    false,
    false,
    false,
  ];

  Widget head_list() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Text(
                "Danh sách thuốc (" + num_type.toString() + ")",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
        Divider(
          height: 1,
        ),
      ],
    );
  }

  Widget type_med(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Checkbox(
                    value: choose[index],
                    onChanged: (newBool) {
                      setState(() {
                        choose[index] = newBool!;
                      });
                    }),
                SizedBox(width: 16,),
                Text(
                  med[index],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              _showDialog(context, EditTypedMed());
            },
            child: Icon(
              Icons.info,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget add_type_med() {
    return GestureDetector(
      onTap: () {
        _showDialog(context, AddTypedMed());
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              spreadRadius: 0.6,
              blurRadius: 2,
              // offset: Offset(0, 3), // changes position of shadow
            )
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.add_circle_outline,
              size: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Thêm mới loại thuốc",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, Widget next) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 10),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                next,
              ],
            ),
          ),
        );
      },
    );
  }
}
