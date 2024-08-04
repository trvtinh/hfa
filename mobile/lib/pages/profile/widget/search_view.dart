import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'search_controller.dart';

class SearchingBar extends GetView<SearchingController> {
  final TextEditingController _controller = TextEditingController();

  SearchingBar({super.key});

  void _clearText() {
    _controller.clear();
    controller.onTextChanged('');
    FocusScope.of(Get.context!).unfocus(); // Dismiss the keyboard
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          onChanged: controller.onTextChanged,
          decoration: InputDecoration(
            hintText: 'Thêm người theo dõi',
            prefixIcon: Obx(() => IconButton(
                  icon: Icon(controller.hasText.value
                      ? Icons.arrow_back
                      : Icons.add_circle_outline),
                  onPressed: () {
                    if (controller.hasText.value) {
                      _clearText();
                    }
                  },
                )),
            suffixIcon: Obx(() => controller.hasText.value
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: _clearText,
                  )
                : const SizedBox.shrink()),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainerHigh,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
        ),
        Obx(() {
          if (controller.searchResults.isEmpty) {
            return const SizedBox.shrink();
          }

          // GlobalKey to measure the height of the ListTile
          GlobalKey listTileKey = GlobalKey();
          double itemHeight = 70;

          // Measure the height of a single ListTile
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final context = listTileKey.currentContext;
            if (context != null) {
              log('Measuring height of ListTile');
              final box = context.findRenderObject() as RenderBox;
              itemHeight = box.size.height;
            }
          });

          const maxItems = 3;
          final itemCount = controller.searchResults.length;
          final height = itemCount > maxItems
              ? itemHeight * maxItems
              : itemHeight * itemCount;

          return Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color for the suggestion box
              borderRadius: BorderRadius.circular(16), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            constraints: BoxConstraints(maxHeight: height),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  final follower = controller.searchResults[index];
                  return FollowerListTile(
                    key: index == 0
                        ? listTileKey
                        : null, // Assign key to the first item for measuring height
                    name: follower['name'],
                    email: follower['email'],
                    imageUrl: follower['photourl'],
                    onTap: () {
                      // Show dialog on tap
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(follower['photoUrl']),
                                    ),
                                    title: Text(follower['name']),
                                    subtitle: Text(follower['email']),
                                  ),
                                  const SizedBox(height: 16),
                                  Text('Thêm người theo dõi',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ChoiceChip(
                                        label: const Text('Người nhà'),
                                        selected: true,
                                        onSelected: (bool selected) {
                                          // Handle selection
                                        },
                                      ),
                                      ChoiceChip(
                                        label: const Text('Chuyên gia y tế'),
                                        selected: false,
                                        onSelected: (bool selected) {
                                          // Handle selection
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Hủy',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('Xác nhận'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          );
        }),
      ],
    );
  }
}

class FollowerListTile extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;
  final VoidCallback onTap;

  const FollowerListTile({
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHigh, // Background color for the list item
        borderRadius:
            BorderRadius.circular(12), // Rounded corners for each list item
      ),
      margin: const EdgeInsets.symmetric(
          vertical: 4, horizontal: 8), // Margin between list items
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(name),
        subtitle: Text(email),
        onTap: onTap,
      ),
    );
  }
}
