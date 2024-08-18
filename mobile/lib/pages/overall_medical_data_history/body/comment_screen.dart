import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/entities/comment.dart';
import 'package:health_for_all/common/helper/datetime_change.dart';
import 'package:health_for_all/pages/overall_medical_data_history/controller.dart';

class CommentScreen extends StatelessWidget {
  CommentScreen({super.key, required this.commentList});
  List<Comment> commentList = [];
  RxBool isExpanded = false.obs;
  final controller = Get.find<OverallMedicalDataHistoryController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.comment,
              size: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text('Bình luận (${commentList.length})')
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: commentList.length,
              itemBuilder: (context, index) {
                final comment = commentList[index];
                return buildBoxComment(comment, context);
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Theme.of(context).colorScheme.surfaceDim),
              child: TextField(
                controller: controller.commentController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: InputBorder.none, // Tắt gạch chân
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16), // Thêm padding nếu cần
                ),
              ),
            )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  size: 18,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ))
          ],
        ),
      ],
    );
  }

  Widget buildBoxComment(Comment comment, BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.comment,
                  size: 16,
                ),
                const SizedBox(
                  width: 6,
                ),
                const Text("·"),
                const SizedBox(
                  width: 6,
                ),
                Text(comment.name),
                const SizedBox(
                  width: 6,
                ),
                const Text("·"),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  '${DatetimeChange.getHourString(comment.time.toDate())}, ${DatetimeChange.getDatetimeString(comment.time.toDate())}',
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                Spacer(),
                Obx(() => IconButton(
                    onPressed: () {
                      isExpanded.value = !isExpanded.value;
                    },
                    icon: isExpanded.value
                        ? const Icon(Icons.keyboard_arrow_up_rounded)
                        : const Icon(Icons.keyboard_arrow_down_rounded)))
              ],
            ),
            Row(
              children: [
                Text('Đã bình luận'),
                const SizedBox(
                  width: 6,
                ),
                const Text("·"),
                const SizedBox(
                  width: 6,
                ),
              ],
            ),
            Text(comment.content)
          ],
        ),
      );
    });
  }
}
