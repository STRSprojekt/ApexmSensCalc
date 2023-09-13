import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService extends GetxController {
  final box = GetStorage();

  RxString theme = 'system'.obs;
  // Key value for theme information that we will keep in Shared Preferences.
  final themeKey = 'theme';

  @override
  void onInit() async {
    super.onInit();

    theme.value = box.read(themeKey) ?? 'system';

    Get.changeThemeMode(theme.value == 'light'
        ? ThemeMode.light
        : theme.value == 'dark'
            ? ThemeMode.dark
            : ThemeMode.system);
    await box.write(themeKey, theme.value);
  }

  changeTheme({required String whichTheme}) async {
    theme.value = whichTheme;
    await box.write(themeKey, whichTheme);

    switch (whichTheme) {
      case 'light':
        Get.changeThemeMode(ThemeMode.light);
        break;
      case 'dark':
        Get.changeThemeMode(ThemeMode.dark);
        break;
      default:
        Get.changeThemeMode(ThemeMode.system);
        break;
    }
  }
}
