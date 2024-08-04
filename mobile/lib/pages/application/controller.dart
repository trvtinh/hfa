import 'package:flutter/material.dart';
import 'index.dart';

import 'package:get/get.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();
  ApplicationController();

  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void handPageChanged(int index) {
    state.page = index;
  }

  void handleNavBarTap(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void onInit() async {
    super.onInit();
    tabTitles = ['Của tôi', 'Đang theo dõi', "Thêm", "Thông báo", 'Cá nhân'];
    bottomTabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.medical_information,
          size: 28,
        ),
        activeIcon: Icon(Icons.medical_information, size: 28),
        label: 'Của tôi',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.family_restroom, size: 28),
        activeIcon: Icon(Icons.family_restroom, size: 28),
        label: 'Đang theo dõi',
      ),
      const BottomNavigationBarItem(
        icon: CustomIcon(
          icon: Icons.add_circle_outline,
          size: 56,
          sizeIcon: 24,
        ),
        activeIcon: CustomIcon(
          icon: Icons.add_circle_outline,
          size: 56,
          sizeIcon: 24,
        ),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.notifications, size: 28),
        activeIcon: Icon(Icons.notifications, size: 28),
        label: 'Thông báo',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined, size: 28),
        activeIcon: Icon(Icons.account_circle_outlined, size: 28),
        label: 'Cá nhân',
      ),
    ];
    pageController = PageController(initialPage: state.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final double sizeIcon;

  const CustomIcon({
    required this.icon,
    required this.size,
    required this.sizeIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .primary, // Background color of the circle
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          size: sizeIcon, // Adjust icon size as needed
          color: Theme.of(context).colorScheme.onPrimary, // Icon color
        ),
      ),
    );
  }
}
