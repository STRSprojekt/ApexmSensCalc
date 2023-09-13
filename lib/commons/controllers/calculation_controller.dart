import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  RxInt fovValue = 80.obs;
  RxInt degGyro = 180.obs;
  RxInt monitorDistance = 50.obs;
  RxInt baseSens = 55.obs;
  RxDouble gyroPrefer = 1.0.obs;
  RxString tipeGyro = 'Med Sens'.obs;

  RxList<num> degList =
      <num>[80.00, 80.00, 68.18, 42.88, 28.33, 20.74, 13.01, 9.096, 6.740].obs;
  RxList<String> resultGyro = List<String>.empty(growable: true).obs;
  RxList<String> resultCam = List<String>.empty(growable: true).obs;

  RxList<double> radList = List<double>.empty(growable: true).obs;

  late double radFov;

  List<String> textTitle = [
    'FPP',
    'TPP',
    '1X',
    '2X',
    '3X',
    '4X',
    '6X',
    '8X',
    '10X'
  ];

  //==============================
  //         CAM SENS PAGE
  //==============================
  void camSensSliderOnChanged(value) {
    monitorDistance.value = value;
  }

  void calcDeg() {
    for (num degScope in degList) {
      var hasilRad = degScope * (pi / 180);
      radList.add(hasilRad);
    }
    radFov = fovValue.value * (pi / 180);
  }

  void calcCam() {
    for (double rad in radList) {
      var hasilSens =
          tan(rad / 2) / tan(radFov / 2) * 300 * monitorDistance.value / 100;
      resultCam.add(hasilSens.toStringAsFixed(0));
    }
  }

  void checkBaseValue(value) {
    if (value == null) {
      return;
    }
    baseSens.value = value;
  }

  void calcCustomSens() {
    for (double rad in radList) {
      var hasilSens = tan(rad / 2) / tan(radList[2] / 2) * baseSens.value;
      resultCam.add(hasilSens.toStringAsFixed(0));
    }
  }

  //==============================
  //         GYRO SENS PAGE
  //==============================

  void gyroSensSliderOnChanged(value) {
    if (value < 1) {
      tipeGyro.value = 'Low Sens';
      degGyro.value = 90;
    } else if (value < 2) {
      tipeGyro.value = 'Med Sens';
      degGyro.value = 180;
    } else if (value < 3) {
      tipeGyro.value = 'High Sens';
      degGyro.value = 360;
    }
    gyroPrefer.value = value;
  }

  void calcGyro() {
    for (num valDeg in degList) {
      var hasil = (valDeg / fovValue.value) * (degGyro.value / 360) * 300;
      resultGyro.add(hasil.toStringAsFixed(0));
    }
    return;
  }
}
