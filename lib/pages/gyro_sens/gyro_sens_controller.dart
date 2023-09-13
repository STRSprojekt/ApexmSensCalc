import 'package:apexmsenscalc/commons/controllers/calculation_controller.dart';
import 'package:apexmsenscalc/commons/widgets/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GyroSensController extends GetxController {
  final calcCtrl = Get.put(CalculationController());
  final String subTitle = 'Calculate';
  final String title = 'Gyroscope Sensitivity';

  final rotdegController = TextEditingController();

  RxList<Widget> resultContainer = List<Widget>.empty(growable: true).obs;

  void addResultContainer() {
    resultContainer.add(ResultContainer(calcCtrl.resultGyro));
  }
}
