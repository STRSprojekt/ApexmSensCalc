// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

_detailContainer(Color bgColor, List<Widget> childWidget) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: childWidget,
    ),
  );
}

class DialogPresetContent extends StatelessWidget {
  const DialogPresetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.8,
      height: height * 0.5,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _detailContainer(
              Theme.of(context).colorScheme.primary,
              [Text("PRESET OPTION")],
            ),
            _detailContainer(
              Theme.of(context).colorScheme.primary,
              [
                Image.asset(
                  'assets/images/howtouse/LogoGameApexm.jpg',
                  width: width * 0.4,
                ),
                Padding(padding: const EdgeInsets.all(10)),
                Text(
                  "1. Go to Apex Mobile Game.",
                ),
              ],
            ),
            _detailContainer(
              Theme.of(context).colorScheme.primary,
              [
                Image.asset(
                  'assets/images/howtouse/GoToSettings.jpg',
                ),
                Padding(padding: const EdgeInsets.all(10)),
                Text("2. Then go to Settings."),
              ],
            ),
            _detailContainer(
              Theme.of(context).colorScheme.primary,
              [
                Image.asset('assets/images/howtouse/GoToGraphicsOption.jpg'),
                Padding(padding: const EdgeInsets.all(5)),
                Image.asset('assets/images/howtouse/ChooseUrFOV.jpg'),
                Padding(padding: const EdgeInsets.all(10)),
                Text(
                    "3. Go to Graphics Option and Tab Display, and then Select FOV you want to use."),
              ],
            ),
            _detailContainer(
              Theme.of(context).colorScheme.primary,
              [
                Image.asset(
                  'assets/icons/app_logo.png',
                  width: width * 0.15,
                ),
                Padding(padding: const EdgeInsets.all(5)),
                Image.asset('assets/images/howtouse/ChooseFOVDropdown.jpg'),
                Padding(padding: const EdgeInsets.all(10)),
                Text(
                  "4. Then go back to this App and choose the same FOV as Apex Mobile Game FOV.",
                ),
              ],
            ),
            _detailContainer(
              Theme.of(context).colorScheme.primary,
              [
                Image.asset('assets/images/howtouse/SliderMonitorDistance.jpg'),
                Padding(padding: const EdgeInsets.all(10)),
                Text(
                  "5. Then select the Monitor Distance according to your wishes.",
                ),
              ],
            ),
            _detailContainer(
              Theme.of(context).colorScheme.primary,
              [
                Image.asset('assets/images/howtouse/CalculateButton.jpg'),
                Padding(padding: const EdgeInsets.all(10)),
                Text(
                  "6. Finally click the 'Calculate' button and apply the sensitivity calculation results to the Apex Mobile game.",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DialogCustomContent extends StatelessWidget {
  const DialogCustomContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.8,
      height: height * 0.5,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _detailContainer(Theme.of(context).colorScheme.primary, [
              Text("CUSTOM OPTION"),
            ]),
            _detailContainer(
              Theme.of(context).colorScheme.primary,
              [
                Image.asset(
                  'assets/images/howtouse/LogoGameApexm.jpg',
                  width: width * 0.4,
                ),
                Padding(padding: const EdgeInsets.all(10)),
                Text(
                  "1. Go to Apex Mobile Game.",
                ),
              ],
            ),
            _detailContainer(
              Theme.of(context).colorScheme.primary,
              [
                Image.asset(
                  'assets/images/howtouse/GoToSettings.jpg',
                ),
                Padding(padding: const EdgeInsets.all(10)),
                Text("2. Then go to Settings."),
              ],
            ),
            _detailContainer(
              Theme.of(context).colorScheme.primary,
              [
                Image.asset('assets/images/howtouse/GoToGraphicsOption.jpg'),
                Padding(padding: const EdgeInsets.all(5)),
                Image.asset('assets/images/howtouse/ChooseUrFOV.jpg'),
                Padding(padding: const EdgeInsets.all(10)),
                Text(
                    "3. Go to Graphics Option and Tab Display, and then Select FOV you want to use."),
              ],
            ),
            _detailContainer(
              Theme.of(context).colorScheme.primary,
              [
                Image.asset(
                  'assets/icons/app_logo.png',
                  width: width * 0.15,
                ),
                Padding(padding: const EdgeInsets.all(5)),
                Image.asset('assets/images/howtouse/ChooseFOVDropdown.jpg'),
                Padding(padding: const EdgeInsets.all(10)),
                Text(
                  "4. Then go back to this App and choose the same FOV as Apex Mobile Game FOV.",
                ),
              ],
            ),
            _detailContainer(Theme.of(context).colorScheme.primary, [
              Text(
                  "5. Then open the Apex Mobile game again and go to the training place then Practice X1 Sensitivity until it matches what you want")
            ]),
            _detailContainer(Theme.of(context).colorScheme.primary, [
              Text(
                  "6. Then open the Apex Mobile game again and go to the training place then Practice X1 Sensitivity until it matches what you want")
            ]),
            _detailContainer(
              Theme.of(context).colorScheme.primary,
              [
                Image.asset('assets/images/howtouse/CalculateButton.jpg'),
                Padding(padding: const EdgeInsets.all(10)),
                Text(
                  "7. Finally click the 'Calculate' button and apply the sensitivity calculation results to the Apex Mobile game.",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DialogMonitorDistance extends StatelessWidget {
  const DialogMonitorDistance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.8,
      height: height * 0.5,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _detailContainer(Theme.of(context).colorScheme.primary, [
              Text("CUSTOM OPTION"),
            ]),
            _detailContainer(Theme.of(context).colorScheme.primary, [
              Text(
                  "1. Go to Apex Mobile Game. Then select the FOV you want to use.")
            ]),
            _detailContainer(Theme.of(context).colorScheme.primary, [
              Text(
                  "2. Then open the Apex Mobile game again and go to the training place then Practice X1 Sensitivity until it matches what you want")
            ]),
            _detailContainer(Theme.of(context).colorScheme.primary, [
              Text(
                  "3. Finally click the 'calculate' button and copy the calculation results into the Apex Mobile game")
            ]),
          ],
        ),
      ),
    );
  }
}
