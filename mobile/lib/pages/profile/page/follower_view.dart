import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/profile/controller.dart';
import 'package:health_for_all/pages/profile/widget/user_ListTile.dart';

import 'search_view.dart';

class FollowerPage extends StatefulWidget {
  const FollowerPage({super.key});
  @override
  State<FollowerPage> createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchingBar(false),
            const SizedBox(
              height: 20,
            ),
            Text(
                'Người thân (${controller.appController.state.profile.value!.relatives!.length})'),
            const Divider(),
            // if (controller.state.profile.value!.relatives!.isEmpty)
            //   const SizedBox.shrink()
            // else
            Container(
              constraints: const BoxConstraints(maxHeight: 150),
              child: StreamBuilder(
                stream: controller.getUserByIds(
                    controller.appController.state.profile.value!.relatives!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Chưa có người thân!'),
                    );
                  } else if (snapshot.hasData) {
                    final users = snapshot.data ?? [];
                    if (users.isEmpty) {
                      return const Center(
                        child: Text("Chưa có người thân"),
                      );
                    }
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return UserListTile(
                            name: user.name!,
                            description: user.id!,
                            imageUrl: user.photourl!,
                            onTap: () {},
                            id: controller
                                .appController.state.profile.value!.id!,
                            collection: 'users',
                            fieldName: 'relatives',
                            valueToRemove: user.id!);
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("Chưa có bác sĩ!!!"),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
                'Chuyên gia y tế (${controller.appController.state.profile.value!.doctors!.length})'),
            const Divider(),
            Container(
              constraints: const BoxConstraints(maxHeight: 200),
              child: StreamBuilder(
                stream: controller.getUserByIds(
                    controller.appController.state.profile.value!.doctors!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Chưa có bác sĩ!'),
                    );
                  } else if (snapshot.hasData) {
                    final users = snapshot.data ?? [];
                    if (users.isEmpty) {
                      return const Center(
                        child: Text("Chưa có bác sĩ"),
                      );
                    }
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return UserListTile(
                            id: controller
                                .appController.state.profile.value!.id!,
                            collection: 'users',
                            fieldName: 'doctors',
                            valueToRemove: user.id!,
                            name: user.name!,
                            description: user.id!,
                            imageUrl: user.photourl!,
                            onTap: () {});
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("Chưa có bác sĩ!!!"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
