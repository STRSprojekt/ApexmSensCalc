import 'package:apexmsenscalc/commons/controllers/calculation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  static ResultController instance = Get.find();
  final calcCtrl = Get.put(CalculationController());

  final fppFieldCtrl = TextEditingController();
  final tppFieldCtrl = TextEditingController();
  final x1FieldCtrl = TextEditingController();
  final x2FieldCtrl = TextEditingController();
  final x3FieldCtrl = TextEditingController();
  final x4FieldCtrl = TextEditingController();
  final x6FieldCtrl = TextEditingController();
  final x8FieldCtrl = TextEditingController();
  final x10FieldCtrl = TextEditingController();
}
