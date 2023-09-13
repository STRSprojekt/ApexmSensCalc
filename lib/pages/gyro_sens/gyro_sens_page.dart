import 'package:apexmsenscalc/commons/controllers/calculation_controller.dart';
import 'package:apexmsenscalc/commons/controllers/dropdown_controller.dart';
import 'package:apexmsenscalc/commons/widgets/dropdown_widget.dart';
import 'package:apexmsenscalc/commons/widgets/header_widget.dart';
import 'package:apexmsenscalc/commons/widgets/tabbar_widget.dart';
import 'package:apexmsenscalc/pages/gyro_sens/gyro_sens_controller.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GyroSensPage extends GetView<GyroSensController> {
  const GyroSensPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calcCtrl = Get.put(CalculationController());
    final dropdownCtrl = Get.put(DropdownController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
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
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Center(
                                    child: Text(
                                  'Sens Preference',
                                  style: Theme.of(context).textTheme.bodyText1,
                                )),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                    child: Text(
                                  ':',
                                  style: Theme.of(context).textTheme.bodyText1,
                                )),
                              ),
                              Expanded(
                                flex: 3,
                                child: Obx(
                                  (() {
                                    return TextFormField(
                                      textAlign: TextAlign.center,
                                      obscureText: false,
                                      controller: TextEditingController(
                                          text: calcCtrl.tipeGyro.value
                                              .toString()),
                                      enabled: false,
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                          Obx(() {
                            return Slider(
                              label: calcCtrl.tipeGyro.value.toString(),
                              value: calcCtrl.gyroPrefer.value,
                              onChanged: (double? newValue) {
                                calcCtrl.gyroSensSliderOnChanged(newValue);
                              },
                              min: 0,
                              max: 2,
                              divisions: 2,
                            );
                          }),
                          const Divider(),
                          ElevatedButton(
                            child: Text(
                              controller.subTitle,
                            ),
                            onPressed: () {
                              controller.resultContainer.clear();
                              calcCtrl.resultGyro.clear();
                              calcCtrl.calcGyro();
                              controller.addResultContainer();
                            },
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
                              controller: controller.rotdegController,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              obscureText: false,
                              maxLength: 3,
                              maxLines: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some Number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: " Enter Number 1-360 ",
                                labelText: "Rotation Degree",
                                icon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.help),
                                ),
                              ),
                            ),
                            const Divider(),
                            ElevatedButton(
                              child: Text(
                                controller.subTitle,
                              ),
                              onPressed: () {
                                final isValidForm =
                                    calcCtrl.formKey.currentState!.validate();
                                if (isValidForm) {
                                  controller.resultContainer.clear();
                                  calcCtrl.resultGyro.clear();
                                  calcCtrl.degGyro.value = int.parse(
                                      controller.rotdegController.text);
                                  calcCtrl.calcGyro();
                                  controller.addResultContainer();
                                }
                              },
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
