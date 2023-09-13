import 'package:apexmsenscalc/models/banner_model.dart';
import 'package:apexmsenscalc/services/banner_services.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController instance = Get.find();
  RxList<BannerModel> bannerItemList =
      List<BannerModel>.empty(growable: true).obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    try {
      isLoading(true);
      var result = await BannerService().getBanners();
      bannerItemList.assignAll(result);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
