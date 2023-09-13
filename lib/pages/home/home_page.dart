import 'package:apexmsenscalc/commons/controllers/banner_controller.dart';
import 'package:apexmsenscalc/commons/widgets/banner_indicator.dart';
import 'package:apexmsenscalc/commons/widgets/banner_loading.dart';
import 'package:apexmsenscalc/commons/widgets/header_widget.dart';
import 'package:apexmsenscalc/pages/camera_sens/cam_sens_page.dart';
import 'package:apexmsenscalc/pages/gyro_sens/gyro_sens_page.dart';

import 'package:apexmsenscalc/pages/home/home_controller.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());

    return GetBuilder<HomeController>(
      builder: ((controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(children: [
              const Padding(padding: EdgeInsets.all(15)),
              HeaderWidget(
                controller.subtitlePage,
                controller.titlePage,
              ),
              Expanded(
                  child: MediaQuery.removePadding(
                context: context,
                removeTop: false,
                child: ListView(
                  children: [
                    Obx(
                      () {
                        if (bannerController.isLoading.value) {
                          return const Center(
                            child: BannerLoading(),
                          );
                        } else {
                          if (bannerController.bannerItemList.isNotEmpty) {
                            return BannerWithIndicator(
                                data: bannerController.bannerItemList);
                          } else {
                            return const Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.hourglass_empty),
                                  Text("Data not found!")
                                ],
                              ),
                            );
                          }
                        }
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Text(
                      controller.textMenu,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    _menuItem(
                      Theme.of(context).canvasColor,
                      Theme.of(context).canvasColor,
                      const BorderRadius.only(bottomRight: Radius.circular(80)),
                      controller.subTitleCard,
                      Theme.of(context).textTheme.bodyText1,
                      controller.titleMenu1,
                      Theme.of(context).textTheme.headline6,
                      const DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: AssetImage('assets/images/tap.png')),
                      (() => Get.to(() => const CamSensPage())),
                    ),
                    _menuItem(
                      Theme.of(context).canvasColor,
                      Theme.of(context).canvasColor,
                      const BorderRadius.only(topLeft: Radius.circular(80)),
                      controller.subTitleCard,
                      Theme.of(context).textTheme.bodyText1,
                      controller.titleMenu2,
                      Theme.of(context).textTheme.headline6,
                      const DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: AssetImage('assets/images/gyroscope.png')),
                      (() => Get.to(() => const GyroSensPage())),
                    ),
                  ],
                ),
              )),
            ]),
          ),
        );
      }),
    );
  }

  _menuItem(
      Color warnaCon,
      Color warnaGmbr,
      BorderRadius corner,
      String subjudul,
      TextStyle? style1,
      String judul,
      TextStyle? style2,
      DecorationImage iconRef,
      VoidCallback actionBut) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 10, top: 20),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: InkWell(
        onTap: actionBut,
        child: Ink(
          decoration:
              BoxDecoration(color: warnaCon, borderRadius: corner, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(10.0, 10.0),
                blurRadius: 20.0,
                spreadRadius: 4.0)
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: warnaGmbr,
                        borderRadius: BorderRadius.circular(25.0),
                        image: iconRef),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.all(8)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subjudul,
                    style: style1,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    judul,
                    style: style2,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
