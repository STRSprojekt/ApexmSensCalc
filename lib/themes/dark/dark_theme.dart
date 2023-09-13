import 'package:apexmsenscalc/themes/dark/dark_color_scheme.dart';
import 'package:apexmsenscalc/themes/element/text_theme.dart';

import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: bgClr,
  colorScheme: appColorDark,
  indicatorColor: mainClr,
  canvasColor: mainClr,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: bgClr),
    titleTextStyle: CustomTextTheme.textThemeDark.headline5,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: thirdClr,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: bgClr,
    unselectedItemColor: secondClr,
    selectedItemColor: readClr,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      onPrimary: readClr,
      primary: thirdClr,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    primary: mainClr,
    backgroundColor: secondClr,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  )),
  sliderTheme: SliderThemeData(
    activeTrackColor: secondClr,
    inactiveTrackColor: secondClr,
    thumbColor: thirdClr,
  ),
  iconTheme: IconThemeData(
    color: readClr,
  ),
  inputDecorationTheme: InputDecorationTheme(
    iconColor: readClr,
    hintStyle: CustomTextTheme.textThemeDark.overline,
    labelStyle: CustomTextTheme.textThemeDark.bodyText1,
    focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: secondClr)),
    hoverColor: readClr,
  ),
  textTheme: CustomTextTheme.textThemeDark,
  dialogTheme: DialogTheme(
    titleTextStyle: TextStyle(
      color: bgClr,
      fontWeight: FontWeight.w500,
      fontSize: 34,
      letterSpacing: 0.25,
    ),
    contentTextStyle: CustomTextTheme.textThemeDark.bodyText1,
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: CustomTextTheme.textThemeDark.bodyText1,
    unselectedLabelStyle: CustomTextTheme.textThemeDark.bodyText2,
  ),
  dividerTheme: DividerThemeData(
    color: readClr,
    space: 40,
  ),
);
