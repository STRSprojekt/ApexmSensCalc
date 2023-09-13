import 'package:apexmsenscalc/pages/camera_sens/cam_sens_page.dart';
import 'package:apexmsenscalc/pages/gyro_sens/gyro_sens_page.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final String titlePage = 'Sensitivity Calculator';
  final String subtitlePage = 'Apex Mobile';
  final String textMenu = 'What sens do you want to adjust?';
  final String subTitleCard = 'Calculate';
  final String titleMenu1 = 'Camera Sensitivity';
  final String titleMenu2 = 'Gyroscope Sensitivity';

  clickMenu1() {
    Get.to(const CamSensPage());
  }

  clickMenu2() {
    Get.to(const GyroSensPage());
  }
}
