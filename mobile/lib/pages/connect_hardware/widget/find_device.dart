import 'package:flutter/material.dart';

class FindDevice extends StatefulWidget {
  final bool complete_find_all;
  const FindDevice({super.key, required this.complete_find_all});

  @override
  State<FindDevice> createState() => _FindDeviceState();
}

class _FindDeviceState extends State<FindDevice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          header(),
          finding(),
        ],
      ),
    );
  }
  
  Widget header(){
    return Row(
      children: [
        Icon(
          Icons.manage_search,
          size: 32,
          color: Theme.of(context).colorScheme.primary,
        ),
        SizedBox(width: 16,),
        Text(
          "Tìm kiếm thiết bị",
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.onSurface
          ),
        ),
      ],
    );
  }

  Widget finding(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/circular-indeterminate.png"),
        Text(
          "Đang tìm kiếm",
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}