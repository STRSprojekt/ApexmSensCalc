import 'package:apexmsenscalc/commons/controllers/calculation_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultContainer extends StatelessWidget {
  final List<String> listResult;

  const ResultContainer(this.listResult, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calcCtrl = Get.put(CalculationController());

    return Container(
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
            const Text("Result",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.all(10)),
            for (var i = 0; i < 9; i++)
              _itemTile(calcCtrl.textTitle[i], listResult[i]),
          ],
        ));
  }

  _disableText(TextEditingController textCtrl) {
    return TextFormField(
      textAlign: TextAlign.center,
      obscureText: false,
      controller: textCtrl,
      enabled: false,
    );
  }

  _itemTile(
    String textResult,
    String textFieldResult,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              color: Theme.of(context).canvasColor,
              child: Center(
                child: Text(textResult),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              color: Theme.of(context).canvasColor,
              child: const Center(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  ' : ',
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              color: Theme.of(context).canvasColor,
              child: Center(
                child: _disableText(
                  TextEditingController(text: textFieldResult),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
