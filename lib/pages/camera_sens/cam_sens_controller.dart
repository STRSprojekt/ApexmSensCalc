import 'package:apexmsenscalc/commons/controllers/calculation_controller.dart';
import 'package:apexmsenscalc/commons/widgets/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CamSensController extends GetxController {
  final calcCtrl = Get.put(CalculationController());
  final String subTitle = 'Calculate';
  final String title = 'Camera Sensitivity';
  final baseSens1xController = TextEditingController();

  RxList<Widget> resultContainer = List<Widget>.empty(growable: true).obs;
  RxInt floatingButIndex = 0.obs;

  void addResultContainer() {
    resultContainer.add(ResultContainer(calcCtrl.resultCam));
  }
}
