import 'package:flutter/material.dart';
import 'package:health_for_all/pages/alarm/widget/edit_alarm.dart';

class ListAlarm extends StatefulWidget {
  final int index;
  const ListAlarm({super.key, required this.index});

  @override
  State<ListAlarm> createState() => _ListAlarmState();
}

class _ListAlarmState extends State<ListAlarm> {

  List<String> med_name = [
    "Huyết áp",
    "Nhịp tim",
    "Thân nhiệt",
    "Cân nặng",
  ];

  List<String> med_unit = [
    "mmHg",
    "lần/phút",
    "°C",
    "kg",
  ];

  List<String> image_path = [
    "assets/medical_data_Home_images/blood-pressure.png",
    "assets/medical_data_Home_images/heart-rate.png",
    "assets/medical_data_Home_images/thermometer.png",
    "assets/medical_data_Home_images/scale.png",
  ];

  List<int> high_lim = [
    130,
    130,
    130,
    100,
  ];

  List<int> low_lim = [
    90,
    50,
    50,
    50,
  ];

  List<bool> isSwitched = [
    true,
    true,
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                spreadRadius: 0.6,
                blurRadius: 2,
                // offset: Offset(0, 3), // changes position of shadow
              )
            ],
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(18),
          ),
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset(image_path[widget.index], height: 32, width: 32),
              SizedBox(width: 16,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      med_name[widget.index],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      med_unit[widget.index],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cao:",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Thấp:",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 24,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          high_lim[widget.index].toString(),
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          low_lim[widget.index].toString(),
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  _showAddDialog(context);
                },
                child: Icon(
                  Icons.border_color_outlined,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              // SizedBox(width: 16,),
              Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: isSwitched[widget.index], 
                  onChanged: (value){
                    setState(() {
                      isSwitched[widget.index] = value;
                    });
                  }
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  void _showAddDialog(BuildContext context) {
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
                EditAlarm(),
              ],
            ),
          ),
        );
      },
    );
  }
}