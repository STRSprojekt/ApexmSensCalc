import 'package:apexmsenscalc/routes/app_pages.dart';
import 'package:apexmsenscalc/routes/app_routes.dart';
import 'package:apexmsenscalc/themes/app_theme.dart';
import 'package:apexmsenscalc/themes/controller/theme_controller.dart';

import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ApexmCalcSens());
}

class ApexmCalcSens extends StatelessWidget {
  const ApexmCalcSens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final themeController = Get.put(ThemeService());
    return GetMaterialApp(
      smartManagement: SmartManagement.onlyBuilder,
      initialRoute: AppRoutes.DASHBOARD,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
