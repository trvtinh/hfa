import 'package:flutter/material.dart';

class PrescriptionBox extends StatefulWidget {
  final String name;
  final int num_type;
  final int num_tablet;
  final String start_date;
  final String end_date;

  const PrescriptionBox({super.key, required this.name, required this.num_type, required this.num_tablet, required this.start_date, required this.end_date});

  @override
  State<PrescriptionBox> createState() => _PrescriptionBoxState();
}

class _PrescriptionBoxState extends State<PrescriptionBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              Icon(
                Icons.medication_liquid,
                color: Theme.of(context).colorScheme.primary,
                size: 32,
              ),
              SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    widget.num_type.toString() + " loại thuốc, " + widget.num_tablet.toString() + " viên",
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  )
                ],
              ),
              SizedBox(width: 38),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Từ ngày:  " + widget.start_date,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Tới ngày: " + widget.end_date,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Icon(
                Icons.border_color,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              )
            ],
          ),
        ),
        SizedBox(height: 12,),
      ],
    );
  }
}