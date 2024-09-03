import 'package:flutter/material.dart';
import 'package:health_for_all/pages/reminder/widget/edit_reminder.dart';

class ListReminder extends StatefulWidget {
  final int index;
  const ListReminder({super.key, required this.index});

  @override
  State<ListReminder> createState() => _ListReminderState();
}

class _ListReminderState extends State<ListReminder> {
  List<String> remind_name = [
    "Nhắc nhở 1",
    "Nhắc nhở 2",
    "Nhắc nhở 3",
    "Nhắc nhở 4",
  ];

  List<String> time = [
    "08:00",
    "08:00",
    "08:00",
    "08:00",
  ];

  List<int> number_reminder = [
    3,
    1,
    0,
    0,
  ];

  List<List<bool>> isRemind = [
    [
      true,
      true,
      true,
      true,
      true,
      true,
      true,
    ],
    [
      false,
      true,
      false,
      true,
      false,
      true,
      false,
    ],
    [
      true,
      true,
      true,
      true,
      true,
      true,
      true,
    ],
    [
      true,
      true,
      true,
      true,
      true,
      true,
      true,
    ],
  ];

  List<bool> isSwitched = [
    true,
    true,
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    int check = 0;
    for (int i = 0; i < 7; i++) {
      if (isRemind[widget.index][i] == true) {
        check += 1;
      }
    }

    return Column(
      children: [
        if (isSwitched[widget.index]) switched(check)
        else unswitched(check),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Widget switched(int check) {
    return Container(
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
          Icon(
            Icons.date_range_outlined,
            size: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  remind_name[widget.index],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 14,
                  ),
                ),
                if (number_reminder[widget.index] == 0)
                  Text(
                    "-",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                      fontSize: 12,
                    ),
                  )
                else
                  Text(
                    number_reminder[widget.index].toString() + " lời nhắc",
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
                      time[widget.index],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                    if (check == 7)
                      Text(
                        "Hằng ngày",
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      )
                    else
                      Row(
                        children: [
                          for (int i = 0; i < 7; i++)
                            if (isRemind[widget.index][i])
                              Row(
                                children: [
                                  Text(
                                    (i + 2).toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ),
                                  ),
                                  if (i != 6)
                                    SizedBox(
                                      width: 4,
                                    ),
                                ],
                              )
                            else
                              Row(
                                children: [
                                  Text(
                                    (i + 2).toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                  ),
                                  if (i != 6)
                                    SizedBox(
                                      width: 4,
                                    ),
                                ],
                              )
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
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
                onChanged: (value) {
                  setState(() {
                    isSwitched[widget.index] = value;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget unswitched(int check){
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            spreadRadius: 0.6,
            blurRadius: 2,
            // offset: Offset(0, 3), // changes position of shadow
          )
        ],
        color: Theme.of(context).colorScheme.outlineVariant,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            Icons.date_range_outlined,
            size: 32,
            color: Theme.of(context).colorScheme.outline,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  remind_name[widget.index],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontSize: 14,
                  ),
                ),
                if (number_reminder[widget.index] == 0)
                  Text(
                    "-",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                      fontSize: 12,
                    ),
                  )
                else
                  Text(
                    number_reminder[widget.index].toString() + " lời nhắc",
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
                      time[widget.index],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                        fontSize: 16,
                      ),
                    ),
                    if (check == 7)
                      Text(
                        "Hằng ngày",
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      )
                    else
                      Row(
                        children: [
                          for (int i = 0; i < 7; i++)
                            if (isRemind[widget.index][i])
                              Row(
                                children: [
                                  Text(
                                    (i + 2).toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ),
                                  ),
                                  if (i != 6)
                                    SizedBox(
                                      width: 4,
                                    ),
                                ],
                              )
                            else
                              Row(
                                children: [
                                  Text(
                                    (i + 2).toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                  ),
                                  if (i != 6)
                                    SizedBox(
                                      width: 4,
                                    ),
                                ],
                              )
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
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
                onChanged: (value) {
                  setState(() {
                    isSwitched[widget.index] = value;
                  });
                }),
          ),
        ],
      ),
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
                EditReminder(),
              ],
            ),
          ),
        );
      },
    );
  }
}