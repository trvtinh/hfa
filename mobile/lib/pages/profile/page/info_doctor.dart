import 'package:flutter/material.dart';

class InfoDoctor extends StatefulWidget {
  const InfoDoctor({super.key});

  @override
  State<InfoDoctor> createState() => _InfoDoctorState();
}

class _InfoDoctorState extends State<InfoDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin chuyên gia y tế"),
        actions: [
          Icon(
            Icons.more_vert,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          SizedBox(width: 12,),
        ],
      ),
      body: Column(
        children: [
          Divider(height: 1,),
        ],
      ),
    );
  }
}