import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/profile/controller.dart';
import 'package:health_for_all/pages/profile/widget/follower_view.dart';
import 'package:health_for_all/pages/profile/widget/following_view.dart';
import 'package:health_for_all/pages/profile/widget/information_view.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Thông tin cá nhân'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text('Thông tin'),
                ),
                Tab(
                  child: Text('Người theo dõi'),
                ),
                Tab(
                  child: Text('Đang theo dõi'),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [InformationPage(), FollowerPage(), FollowingPage()],
          )),
    );
  }
}
