import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/homepage/view.dart';
import 'package:health_for_all/pages/medical_data/view.dart';
import 'package:health_for_all/pages/notification/view.dart';
import 'package:health_for_all/pages/profile/view.dart';
import 'controller.dart';

class ApplicationPage extends GetView<ApplicationController> {
  ApplicationPage({super.key});

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
          NotificationPage(),
          ProfilePage()
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
            selectedLabelStyle:
                const TextStyle(fontSize: 12), // Adjust label size for selected items
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            // unselectedItemColor: AppColors.tabBarElement,
            // selectedItemColor: AppColors.thirdElementText,
          ));
    }

    Widget buildDrawerHeader(){
      return const UserAccountsDrawerHeader(
        accountName: Text('HEALTH FOR ALL'),
        accountEmail: Text('từ NK Solution')
      );
    }

    Widget buildDrawer(){
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:[
            buildDrawerHeader(),
            ListTile(
              leading: const Icon(Icons.monitor_heart),
              title: const Text('Dữ liệu sức khỏe'),
            ),
            
            ListTile(
              leading: const Icon(Icons.health_and_safety),
              title: const Text('Chuẩn đoán'),
            ),

            ListTile(
              leading: const Icon(Icons.medication_liquid),
              title: const Text('Đơn thuốc'),
            ),

            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text('Nhắc nhỏ'),
            ),

            ListTile(
              leading: const Icon(Icons.notifications_none),
              title: const Text('Thông báo'),
            ),

            ListTile(
              leading: const Icon(Icons.warning_amber),
              title: const Text('Cảnh báo'),
            ),

            ListTile(
              leading: const Icon(Icons.memory),
              title: const Text('Kết nối với thiết bị'),
            ),

            ListTile(
              leading: const Icon(Icons.smart_toy),
              title: const Text('Trò chuyện với HFA-Bot'),
            ),
          ],
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Health For All'),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/HFA_small_icon.png',),
          ),
        ],
      ),
      drawer: buildDrawer(),
      body: buildPageView(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
