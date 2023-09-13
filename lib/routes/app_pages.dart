import 'package:apexmsenscalc/pages/all_binding.dart';
import 'package:apexmsenscalc/pages/camera_sens/cam_sens_page.dart';
import 'package:apexmsenscalc/pages/dashboard/dashboard_page.dart';
import 'package:apexmsenscalc/pages/gyro_sens/gyro_sens_page.dart';
import 'package:apexmsenscalc/pages/home/home_page.dart';
import 'package:apexmsenscalc/pages/settings/settings_page.dart';

import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.SETTINGS,
      page: () => const SettingsPage(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.CAMSENSPAGE,
      page: () => const CamSensPage(),
      binding: CamSensPageBinding(),
    ),
    GetPage(
      name: AppRoutes.GYROSENSPAGE,
      page: () => const GyroSensPage(),
      binding: GyroSensPageBinding(),
    ),
  ];
}
