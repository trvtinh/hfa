import 'package:flutter/material.dart';

class MoreData extends StatefulWidget {
  const MoreData({super.key});

  @override
  State<MoreData> createState() => _MoreDataState();
}

class _MoreDataState extends State<MoreData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_circle_outline,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          SizedBox(width: 16,),
          Text(
            "Thêm loại dữ liệu khác",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }
}