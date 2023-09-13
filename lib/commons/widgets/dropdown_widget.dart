import 'package:apexmsenscalc/commons/controllers/calculation_controller.dart';
import 'package:apexmsenscalc/models/dropdown_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownWidget extends StatefulWidget {
  final List<FovModel> data;

  const DropdownWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DropdownWidgetState();
  }
}

class _DropdownWidgetState extends State<DropdownWidget> {
  final calcController = Get.put(CalculationController());
  late List<DropdownMenuItem<dynamic>> dropdownItem;

  @override
  void initState() {
    dropdownItem = widget.data.map((item) {
      return DropdownMenuItem(
        onTap: () => item.fov,
        value: "${item.fov}",
        child: Center(
          child: Text(
            item.fov.toString(),
          ),
        ),
      );
    }).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DropdownButtonFormField<dynamic>(
      dropdownColor: Theme.of(context).canvasColor,
      alignment: AlignmentDirectional.center,
      menuMaxHeight: height * 0.2,
      decoration: InputDecoration(
        fillColor: Theme.of(context).primaryColor,
        labelText: "FOV",
        hintText: 'Choose',
        icon: IconButton(
          onPressed: () {
            Get.defaultDialog(
              title: "Field Of View",
              backgroundColor: Theme.of(context).colorScheme.secondary,
              titlePadding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              radius: 20,
            );
          },
          icon: const Icon(Icons.help),
        ),
      ),
      isExpanded: false,
      items: dropdownItem,
      value: calcController.fovValue.value.toString(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Select Your FOV';
        }
        return null;
      },
      onChanged: (currentValue) {
        calcController.degList.clear();
        calcController.fovValue.value = int.parse(currentValue);
        var indexFov =
            widget.data.indexWhere((i) => i.fov == int.parse(currentValue));
        var tempDegList = widget.data[indexFov].degreelist;
        for (num deg in tempDegList!) {
          calcController.degList.add(deg);
        }
      },
    );
  }
}
