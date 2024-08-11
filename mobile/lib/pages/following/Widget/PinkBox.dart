import 'package:flutter/material.dart';

class Pinkbox extends StatefulWidget {
  final String avapath;
  final String name;
  final String gender;
  final String age;
  final String time;
  final String person;
  final String warning;

  const Pinkbox(
      {super.key,
      required this.avapath,
      required this.name,
      required this.gender,
      required this.age,
      required this.time,
      required this.person,
      required this.warning});

  @override
  State<Pinkbox> createState() => PinkBoxState();
}

class PinkBoxState extends State<Pinkbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: 380,
      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(255, 216, 228, 1),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              spreadRadius: 1,
              blurRadius: 2,
            )
          ]),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(widget.avapath),
          ),
          SizedBox(
            width: 12,
          ),
          SizedBox(
            width: 130,
            height: 68,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.gender,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      widget.age,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    Text(
                      ' tuổi',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Cập nhật: ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      widget.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          SizedBox(
            width: 146,
            height: 52,
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.primaryFixedDim,
                  ),
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  child: SizedBox(
                    width: 88,
                    height: 16,
                    child: Text(
                      widget.person,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  width: 120,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.primaryFixedDim,
                  ),
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cảnh báo',
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      Badge(
                        // child: Text("2"),
                        label: Text(widget.warning),
                        largeSize: 16,
                        backgroundColor: widget.warning == '0'
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.error,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
