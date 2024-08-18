import 'package:flutter/material.dart';
import 'package:health_for_all/common/entities/comment.dart';

class CommentScreen extends StatelessWidget {
  CommentScreen({super.key});
  List<Comment> commentList = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
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
                return buildBoxComment(comment);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBoxComment(Comment) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.comment,
                size: 16,
              ),
              const SizedBox(
                width: 6,
              ),
              Text("·"),
              const SizedBox(
                width: 6,
              ),
            ],
          )
        ],
      ),
    );
  }
}
