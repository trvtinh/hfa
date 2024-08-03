import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/homepage/view.dart';
import 'package:health_for_all/pages/medical_data/view.dart';
import 'package:health_for_all/pages/notification/view.dart';
import 'package:health_for_all/pages/profile/view.dart';
import 'controller.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildPageView() {
      return PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.handPageChanged,
        children: [
          const Homepage(),
          const Homepage(),
          MedicalDataPage(),
          const NotificationPage(),
          const ProfilePage()
        ],
      );
    }

    Widget buildBottomNavigationBar() {
      return Obx(() => BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
            items: controller.bottomTabs,
            currentIndex: controller.state.page,
            type: BottomNavigationBarType.fixed,
            onTap: controller.handleNavBarTap,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedLabelStyle: const TextStyle(
                fontSize: 12), // Adjust label size for selected items
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            // unselectedItemColor: AppColors.tabBarElement,
            // selectedItemColor: AppColors.thirdElementText,
          ));
    }

    Widget buildDrawerHeader() {
      return const UserAccountsDrawerHeader(
          accountName: Text('HEALTH FOR ALL'),
          accountEmail: Text('từ NK Solution'));
    }

    Widget buildDrawer() {
      return Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildDrawerHeader(),
          const ListTile(
            leading: Icon(Icons.monitor_heart),
            title: Text('Dữ liệu sức khỏe'),
          ),
          const ListTile(
            leading: Icon(Icons.health_and_safety),
            title: Text('Chuẩn đoán'),
          ),
          const ListTile(
            leading: Icon(Icons.medication_liquid),
            title: Text('Đơn thuốc'),
          ),
          const ListTile(
            leading: Icon(Icons.date_range),
            title: Text('Nhắc nhỏ'),
          ),
          const ListTile(
            leading: Icon(Icons.notifications_none),
            title: Text('Thông báo'),
          ),
          const ListTile(
            leading: Icon(Icons.warning_amber),
            title: Text('Cảnh báo'),
          ),
          const ListTile(
            leading: Icon(Icons.memory),
            title: Text('Kết nối với thiết bị'),
          ),
          const ListTile(
            leading: Icon(Icons.smart_toy),
            title: Text('Trò chuyện với HFA-Bot'),
          ),
        ],
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Health For All'),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/HFA_small_icon.png',
            ),
          ),
        ],
      ),
      drawer: buildDrawer(),
      body: buildPageView(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
