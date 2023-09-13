import 'package:apexmsenscalc/models/dropdown_model.dart';
import 'package:apexmsenscalc/services/dropdown_services.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController {
  static DropdownController instance = Get.find();
  RxList<FovModel> dropdownItemList = List<FovModel>.empty(growable: true).obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      var result = await DropdownService().getDropdownFov();
      dropdownItemList.assignAll(result);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
