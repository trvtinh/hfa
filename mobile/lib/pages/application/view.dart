import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/homepage/view.dart';
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
        children: const [
          Homepage(),
          Homepage(),
          Homepage(),
          Homepage(),
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

    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
