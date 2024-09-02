import 'package:flutter/material.dart';

class SeenPage extends StatefulWidget {
  const SeenPage({super.key});

  @override
  State<SeenPage> createState() => _SeenPageState();
}

class _SeenPageState extends State<SeenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(),
    );
  }
}
