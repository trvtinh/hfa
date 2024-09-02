import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/chatbot/controller.dart';
import 'package:health_for_all/pages/chatbot/widget/chat_list.dart';
import 'package:image_picker/image_picker.dart';

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
          child: Column(
            children: [
              Expanded(
                child: const ChatList(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.surfaceContainer,
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // Adjust height based on content
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 16),
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
                        const SizedBox(width: 8),
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
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Theme.of(context).colorScheme.surfaceDim,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(() {
                                  if (controller.state.image.value != null) {
                                    return Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.file(
                                            File(controller
                                                .state.image.value!.path),
                                            height: 60,
                                            width: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          right: -10,
                                          top: -10,
                                          child: IconButton(
                                            onPressed: () {
                                              controller.state.image.value =
                                                  null;
                                            },
                                            icon: Icon(
                                              Icons.close,
                                              size: 18,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .error,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  } else {
                                    return SizedBox
                                        .shrink(); // Returns an empty widget if no image
                                  }
                                }),
                                TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 3,
                                  controller: controller.textController,
                                  autofocus: false,
                                  focusNode: controller.textNode,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () async {
                                        if (controller
                                            .textController.text.isNotEmpty) {
                                          if (controller.state.image.value !=
                                              null) {
                                            await controller
                                                .sendImageWithMessage();
                                          } else {
                                            await controller.sendMessage();
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  "Xin hãy nhập tin nhắn."),
                                            ),
                                          );
                                        }
                                      },
                                      icon: const Icon(Icons.send),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Nhập tin nhắn ...",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                  ),
                                  onTap: () {
                                    for (var i in controller.state.chatList) {
                                      log(i.toString());
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          margin: const EdgeInsets.only(left: 10, top: 5),
                          height: 35,
                          child: ElevatedButton(
                            child: const Text("Send"),
                            onPressed: () async {
                              if (controller.textController.text.isNotEmpty) {
                                if (controller.state.image.value != null) {
                                  await controller.sendImageWithMessage();
                                } else {
                                  await controller.sendMessage();
                                }
                              } else {
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
