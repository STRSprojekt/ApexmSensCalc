import 'package:apexmsenscalc/commons/controllers/calculation_controller.dart';
import 'package:apexmsenscalc/commons/controllers/dropdown_controller.dart';
import 'package:apexmsenscalc/commons/widgets/dialog_content.dart';
import 'package:apexmsenscalc/commons/widgets/dropdown_widget.dart';
import 'package:apexmsenscalc/commons/widgets/header_widget.dart';
import 'package:apexmsenscalc/commons/widgets/tabbar_widget.dart';
import 'package:apexmsenscalc/pages/camera_sens/cam_sens_controller.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CamSensPage extends GetView<CamSensController> {
  const CamSensPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calcCtrl = Get.put(CalculationController());
    final dropdownCtrl = Get.put(DropdownController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.secondary,
          tooltip: 'Back',
          onPressed: () => Get.back(),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverHeaderSection([
                HeaderWidget(
                  controller.subTitle,
                  controller.title,
                ),
              ]),
              const SliverTabSection([
                Tab(
                  text: 'Preset',
                ),
                Tab(
                  text: 'Custom',
                )
              ])
            ];
          },
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(30),
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(10.0, 10.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0)
                          ]),
                      child: Column(
                        children: [
                          Obx(
                            () {
                              if (dropdownCtrl.isLoading.value) {
                                return const CircularProgressIndicator();
                              } else {
                                if (dropdownCtrl.dropdownItemList.isNotEmpty) {
                                  return DropdownWidget(
                                      data: dropdownCtrl.dropdownItemList);
                                } else {
                                  return const Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                          Obx(
                            (() {
                              return TextFormField(
                                readOnly: true,
                                obscureText: false,
                                controller: TextEditingController(
                                    text: calcCtrl.monitorDistance.value
                                        .toString()),
                                decoration: InputDecoration(
                                  labelText: "Monitor Distance",
                                  icon: IconButton(
                                    icon: const Icon(Icons.help),
                                    tooltip: 'Back',
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: "Monitor Distance",
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        titlePadding: const EdgeInsets.only(
                                          top: 20,
                                          left: 20,
                                          right: 20,
                                          bottom: 10,
                                        ),
                                        radius: 20,
                                      );
                                    },
                                  ),
                                ),
                              );
                            }),
                          ),
                          Obx(() {
                            return Slider(
                              label: '${calcCtrl.monitorDistance.value}',
                              value: calcCtrl.monitorDistance.value.toDouble(),
                              onChanged: (double value) {
                                calcCtrl.camSensSliderOnChanged(value.toInt());
                              },
                              min: 5,
                              max: 100,
                            );
                          }),
                          const Divider(),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: OutlinedButton.icon(
                                  icon: const Icon(
                                    Icons.help_center_rounded,
                                    size: 18,
                                  ),
                                  label: const Text('How To Use?'),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "How To Use",
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      titlePadding: const EdgeInsets.only(
                                        top: 20,
                                        left: 20,
                                        right: 20,
                                        bottom: 10,
                                      ),
                                      content: const DialogPresetContent(),
                                      radius: 20,
                                    );
                                  },
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(10)),
                              Expanded(
                                flex: 5,
                                child: ElevatedButton(
                                  child: const Text(
                                    "Calculate",
                                  ),
                                  onPressed: () {
                                    controller.resultContainer.clear();
                                    calcCtrl.radList.clear();
                                    calcCtrl.resultCam.clear();
                                    calcCtrl.calcDeg();
                                    calcCtrl.calcCam();
                                    controller.addResultContainer();
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      return Column(
                        children: controller.resultContainer,
                      );
                    })
                  ],
                ),
                ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(30),
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(10.0, 10.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0)
                          ]),
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: calcCtrl.formKey,
                        child: Column(
                          children: [
                            Obx(
                              () {
                                if (dropdownCtrl.isLoading.value) {
                                  return const CircularProgressIndicator();
                                } else {
                                  if (dropdownCtrl
                                      .dropdownItemList.isNotEmpty) {
                                    return DropdownWidget(
                                        data: dropdownCtrl.dropdownItemList);
                                  } else {
                                    return const Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                            const Padding(padding: EdgeInsets.all(5)),
                            TextFormField(
                              controller: controller.baseSens1xController,
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              enabled: true,
                              obscureText: false,
                              maxLines: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some Number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: " Range 0-300 ",
                                labelText: "Base Sensitivity X1",
                                icon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.help),
                                ),
                              ),
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: OutlinedButton.icon(
                                    icon: const Icon(
                                      Icons.help_center_rounded,
                                      size: 18,
                                    ),
                                    label: const Text('How To Use?'),
                                    onPressed: () {
                                      Get.defaultDialog(
                                          title: "How To Use",
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          titlePadding: const EdgeInsets.only(
                                              top: 20,
                                              left: 20,
                                              right: 20,
                                              bottom: 10),
                                          content: const DialogCustomContent(),
                                          radius: 20);
                                    },
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(10)),
                                Expanded(
                                  flex: 5,
                                  child: ElevatedButton(
                                    child: Text(
                                      controller.subTitle,
                                    ),
                                    onPressed: () {
                                      final isValidForm = calcCtrl
                                          .formKey.currentState!
                                          .validate();
                                      if (isValidForm) {
                                        controller.resultContainer.clear();
                                        calcCtrl.radList.clear();
                                        calcCtrl.resultCam.clear();
                                        calcCtrl.calcDeg();
                                        calcCtrl.checkBaseValue(int.parse(
                                            controller
                                                .baseSens1xController.text));
                                        calcCtrl.calcCustomSens();
                                        controller.addResultContainer();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(() {
                      return Column(
                        children: controller.resultContainer,
                      );
                    })
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
