// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

final Color mainClr = Color.fromARGB(255, 78, 125, 150);
final Color secondClr = Color.fromARGB(255, 159, 201, 221);
final Color thirdClr = Color.fromARGB(255, 255, 132, 75);
final Color bgClr = Color.fromARGB(255, 26, 31, 43);
final Color readClr = Color.fromARGB(255, 227, 237, 242);

ColorScheme appColorDark = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: mainClr,
    onPrimary: mainClr.withAlpha(200),
    secondary: secondClr,
    onSecondary: secondClr.withAlpha(200),
    error: thirdClr,
    onError: thirdClr.withAlpha(200),
    background: bgClr,
    onBackground: bgClr.withAlpha(200),
    surface: readClr,
    onSurface: readClr.withAlpha(200));
