import 'package:flutter/material.dart';

class InfoReminder extends StatefulWidget {
  final String name;
  const InfoReminder({super.key, required this.name});

  @override
  State<InfoReminder> createState() => _InfoReminderState();
}

class _InfoReminderState extends State<InfoReminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}