import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/chatbot/controller.dart';

class ChatbotPage extends GetView<ChatbotController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat với HFA'),
      ),
    );
  }
}
