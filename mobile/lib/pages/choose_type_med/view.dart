import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: SingleChildScrollView(
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
                  for (int i = 0; i < num_type; i++) type_med(med[i]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int num_type = 4;

  List<String> med = [
    "Vitamin A",
    "Vitamin B",
    "Vitamin C",
    "Vitamin D",
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

  Widget type_med(String name) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
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
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.medication_outlined,
                        size: 24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: 16,),
                      Text(
                        name,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(children: [
                  Icon(
                    Icons.border_color,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],)
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget add_type_med() {
    return GestureDetector(
      onTap: (){
        _showDialog(context);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.errorContainer,
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
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Thêm mới loại thuốc",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
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
                
              ],
            ),
          ),
        );
      },
    );
  }

  Widget detail_add(){
    return Column(
      children: [
        
      ],
    );
  }
}
