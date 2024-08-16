import 'package:flutter/material.dart';

class UnreadPage extends StatefulWidget {
  const UnreadPage({super.key});

  @override
  State<UnreadPage> createState() => _UnreadPageState();
}

class _UnreadPageState extends State<UnreadPage> {
  // @override
  List<bool> _isExpandedList = [false, false, false];

  void _toggleContainer(int index) {
    setState(() {
      _isExpandedList[index] = !_isExpandedList[index];
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
            // child: Column(
            //   children: List.generate(3, generator)
            // ),
            ),
      ),
    );
  }
}
