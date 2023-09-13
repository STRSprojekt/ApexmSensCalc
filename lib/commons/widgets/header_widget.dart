import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;

  const HeaderWidget(this.firstTitle, this.secondTitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.12,
      child: Stack(
        children: [
          Positioned(
            top: 22,
            right: 0,
            child: Container(
              height: height * 0.07,
              width: width * 0.75,
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50))),
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: Text(
              firstTitle,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Positioned(
            top: 45,
            right: 20,
            child: Text(
              secondTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}
