// ignore_for_file: deprecated_member_use

import 'package:apexmsenscalc/themes/element/text_theme.dart';
import 'package:apexmsenscalc/themes/light/light_color_scheme.dart';

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: bgClr,
  colorScheme: appColorLight,
  indicatorColor: mainClr,
  canvasColor: mainClr,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: bgClr),
    titleTextStyle: CustomTextTheme.textThemeLight.headline5,
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
      hintStyle: CustomTextTheme.textThemeLight.overline,
      labelStyle: CustomTextTheme.textThemeLight.bodyText1,
      focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: secondClr)),
      focusColor: readClr,
      errorStyle: TextStyle(
        color: thirdClr,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      )),
  textTheme: CustomTextTheme.textThemeLight,
  dialogTheme: DialogTheme(
    titleTextStyle: TextStyle(
      color: bgClr,
      fontWeight: FontWeight.w500,
      fontSize: 34,
      letterSpacing: 0.25,
    ),
    contentTextStyle: CustomTextTheme.textThemeLight.bodyText1,
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: CustomTextTheme.textThemeLight.bodyText1,
    unselectedLabelStyle: CustomTextTheme.textThemeLight.bodyText2,
  ),
  dividerTheme: DividerThemeData(
    color: readClr,
    space: 40,
  ),
);
