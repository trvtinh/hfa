import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SamsungConnect extends StatelessWidget {
  const SamsungConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Samsung Health Connect",
        ),
        actions: [
          Icon(
            Icons.help_outline,
          ),
          SizedBox(width: 10,),
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