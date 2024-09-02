import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/entities/comment.dart';
import 'package:health_for_all/common/helper/datetime_change.dart';
import 'package:health_for_all/pages/overall_medical_data_history/controller.dart';

class CommentScreen extends StatelessWidget {
  CommentScreen({super.key});
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
            Obx(() =>
                Text('Bình luận (${controller.state.commmentList.length})'))
          ],
        ),
        const SizedBox(height: 10),
        Obx(
          () => Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: const Border(
                    top: BorderSide(color: Colors.grey),
                    bottom: BorderSide(color: Colors.grey),
                  ),
                  color: Theme.of(context).colorScheme.surfaceContainer),
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: controller.state.commmentList.length,
                itemBuilder: (context, index) {
                  final comment = controller.state.commmentList[index];
                  return FutureBuilder<String>(
                    future: controller.getUser(comment.uid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final name = snapshot.data ?? 'Unknown';
                        return Column(
                          children: [
                            buildBoxComment(comment, context, name),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        );
                      }
                    },
                  );
                },
              ),
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
                onPressed: () async {
                  await controller.addComment(context);
                  await controller.getAllCommentByMedicalType();
                  controller.commentController.clear();
                },
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

  Widget buildBoxComment(Comment comment, BuildContext context, String name) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.surfaceContainerLowest),
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
                Text(name),
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
                // Spacer(),
                // Obx(() => IconButton(
                //     onPressed: () {
                //       isExpanded.value = !isExpanded.value;
                //     },
                //     icon: isExpanded.value
                //         ? const Icon(Icons.keyboard_arrow_up_rounded)
                //         : const Icon(Icons.keyboard_arrow_down_rounded)))
              ],
            ),
            const Row(
              children: [
                Text('Đã bình luận'),
                SizedBox(
                  width: 6,
                ),
                // const Text("·"),
                // const SizedBox(
                //   width: 6,
                // ),
              ],
            ),
            Text(comment.content)
          ],
        ),
      );
    });
  }
}
