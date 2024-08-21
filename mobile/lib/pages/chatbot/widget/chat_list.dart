import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/chatbot/controller.dart';
import 'package:health_for_all/pages/chatbot/widget/left_chat.dart';
import 'package:health_for_all/pages/chatbot/widget/right_chat.dart';

class ChatList extends GetView<ChatbotController> {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: Theme.of(context).colorScheme.surface,
          padding: EdgeInsets.only(bottom: 50.h),
          child: CustomScrollView(
            reverse: false,
            controller: controller.scrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  var item = controller.state.chatList[index];
                  if (item.role == 'User') {
                    return RightChat(item);
                  }
                  return LeftChat(item);
                }, childCount: controller.state.chatList.length)),
              )
            ],
          ),
        ));
  }
}
