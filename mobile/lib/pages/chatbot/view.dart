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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Stack(
              children: [
                const ChatList(),
                Positioned(
                    bottom: 0,
                    height: 88,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          // GestureDetector(
                          //   child: const Icon(
                          //     Icons.add_circle,
                          //     size: 20,
                          //     color: Colors.blue,
                          //   ),
                          //   onTap: () {
                          //     controller.pickImageFromGallery();
                          //   },
                          // ),
                          // SizedBox(width: 10,),
                          GestureDetector(
                            child: const Icon(
                              Icons.photo_outlined,
                              size: 20,
                              color: Colors.blue,
                            ),
                            onTap: () {
                              controller.pickImageFromGallery();
                            },
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            child: const Icon(
                              Icons.camera,
                              size: 20,
                              color: Colors.blue,
                            ),
                            onTap: () {
                              controller.pickImageFromCamera();
                            },
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                color: Theme.of(context).colorScheme.surfaceDim,
                              ),
                              height: 56,
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                controller: controller.textController,
                                autofocus: false,
                                focusNode: controller.textNode,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () async {
                                      if (controller.textController.text !=
                                          '') {
                                        if (controller.state.image.value !=
                                            null) {
                                          await controller
                                              .sendImageWithMessage();
                                        } else {
                                          await controller.sendMessage();
                                        }
                                      } else {
                                        // Hiển thị thông báo lỗi nếu không có nội dung hoặc hình ảnh
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("Xin hãy nhập tin nhắn."),
                                          ),
                                        );
                                      }
                                    },
                                    icon: Icon(Icons.send),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Nhập tin nhắn ...",
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                ),
                                onTap: () {
                                  for (var i in controller.state.chatList) {
                                    log(i.toString());
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, top: 5),
                            height: 35,
                            child: ElevatedButton(
                              child: const Text("Send"),
                              onPressed: () async {
                                if (controller.textController.text != '') {
                                  if (controller.state.image.value != null) {
                                    await controller.sendImageWithMessage();
                                  } else {
                                    await controller.sendMessage();
                                  }
                                } else {
                                  // Hiển thị thông báo lỗi nếu không có nội dung hoặc hình ảnh
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Xin hãy nhập tin nhắn."),
                                    ),
                                  );
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
      ),
    );
  }
}
