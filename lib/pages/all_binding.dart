import 'package:apexmsenscalc/commons/controllers/banner_controller.dart';
import 'package:apexmsenscalc/commons/controllers/calculation_controller.dart';
import 'package:apexmsenscalc/commons/controllers/dropdown_controller.dart';
import 'package:apexmsenscalc/pages/camera_sens/cam_sens_controller.dart';
import 'package:apexmsenscalc/pages/dashboard/dashboard_controller.dart';
import 'package:apexmsenscalc/pages/gyro_sens/gyro_sens_controller.dart';
import 'package:apexmsenscalc/pages/home/home_controller.dart';
import 'package:apexmsenscalc/pages/settings/settings_controller.dart';
import 'package:apexmsenscalc/themes/controller/theme_controller.dart';

import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<CamSensController>(() => CamSensController());
    Get.lazyPut<GyroSensController>(() => GyroSensController());
    Get.lazyPut<ThemeService>(() => ThemeService());
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<BannerController>(() => BannerController());
  }
}

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<ThemeService>(() => ThemeService());
  }
}

class CamSensPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CamSensController>(() => CamSensController());
    Get.lazyPut<CalculationController>(() => CalculationController());
    Get.lazyPut<DropdownController>(() => DropdownController());
  }
}

class GyroSensPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GyroSensController>(() => GyroSensController());
    Get.lazyPut<CalculationController>(() => CalculationController());
    Get.lazyPut<DropdownController>(() => DropdownController());
  }
}
