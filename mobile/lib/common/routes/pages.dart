import 'package:get/get.dart';
import 'package:health_for_all/pages/application/index.dart';
import 'package:health_for_all/pages/sign_in/index.dart';

import '../../pages/profile/index.dart';
import 'names.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const SignIn = AppRoutes.SIGN_IN;
  static const Application = AppRoutes.Application;
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.Application,
      page: () => const ApplicationPage(),
      binding: ApplicationBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const LogIn(),
    ),
    GetPage(
        name: AppRoutes.Profile,
        page: () => const ProfilePage(),
        binding: ProfileBinding()),
  ];
}
