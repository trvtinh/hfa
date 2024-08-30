import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/chart/controller.dart';
import 'package:health_for_all/pages/chart/widget/show.dart';

class ChartPage extends GetView<ChartController> {
  ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Huyết áp",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.assessment,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Divider(height: 1),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            height: 58,
            child: Row(
              children: [
                SizedBox(width: 16),
                Icon(
                  Icons.arrow_back_ios_new,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(width: 8),
                Text(
                  "28/07/2024",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                SizedBox(width: 8),
                Text("-"),
                SizedBox(width: 8),
                Text(
                  "03/08/2024",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(width: 15),
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.comment,
                    color: Theme.of(context).colorScheme.primary,
                    size: 18,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.comment,
                    color: Theme.of(context).colorScheme.primary,
                    size: 18,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.warning_amber,
                    color: Theme.of(context).colorScheme.primary,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: Colors.black),
          Expanded(
            // Wrap Show in Expanded
            child: Show(),
          ),
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}
