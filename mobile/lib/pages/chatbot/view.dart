import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/chatbot/controller.dart';
import 'package:health_for_all/pages/chatbot/widget/chat_list.dart';

class ChatbotPage extends GetView<ChatbotController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat với HFA'),
      ),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: [
              ChatList(),
              Positioned(
                  bottom: 0,
                  height: 50,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              controller: controller.textController,
                              autofocus: false,
                              focusNode: controller.textNode,
                              decoration: const InputDecoration(
                                  hintText: "Nhập tin nhắn ..."),
                              onTap: () {
                                for (var i in controller.state.chatList) {
                                  log(i.toString());
                                }
                              },
                            ),
                          ),
                        ),
                        // Container(
                        //   height: 30,
                        //   width: 30,
                        //   margin: EdgeInsets.only(left: 5),
                        //   child: GestureDetector(
                        //     child: Icon(
                        //       Icons.photo_outlined,
                        //       size: 35,
                        //       color: Colors.blue,
                        //     ),
                        //     onTap: () {
                        //       controller.pickImageFromGallery();
                        //     },
                        //   ),
                        // ),
                        // Container(
                        //   height: 30,
                        //   width: 30,
                        //   margin: EdgeInsets.only(left: 5),
                        //   child: GestureDetector(
                        //     child: Icon(
                        //       Icons.camera,
                        //       size: 35,
                        //       color: Colors.blue,
                        //     ),
                        //     onTap: () {
                        //       controller.pickImageFromCamera();
                        //     },
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 5),
                          height: 35,
                          child: ElevatedButton(
                            child: const Text("Send"),
                            onPressed: () {
                              controller.sendMessage();
                              for (var i in controller.state.chatList) {
                                log(i.toString());
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
