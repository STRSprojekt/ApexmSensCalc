import 'package:apexmsenscalc/pages/settings/settings_controller.dart';
import 'package:apexmsenscalc/themes/controller/theme_controller.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeService());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(controller.title),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Obx(() => SwitchListTile(
                    title: const Text('Dark mode'),
                    value: themeController.theme.value == 'dark' ? true : false,
                    onChanged: (val) {
                      val
                          ? themeController.changeTheme(whichTheme: 'dark')
                          : themeController.changeTheme(whichTheme: 'light');
                    },
                  )),
              Obx(
                () => SwitchListTile(
                  title: const Text('Use device settings'),
                  value: themeController.theme.value == 'system' ? true : false,
                  onChanged: (val) {
                    themeController.changeTheme(whichTheme: 'system');
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(15)),
              const Divider(),
              Center(
                  child: Text('About',
                      style: Theme.of(context).textTheme.headline5)),
              _itemTile(
                const Icon(Icons.account_box),
                const Text('Twitter'),
                (() => Uri.parse('https://twitter.com/STRSprojekt')),
              ),
              _itemTile(
                const Icon(Icons.shop),
                const Text('Rate On Google Play'),
                (() => Uri.parse('')),
              ),
              _itemTile(
                const Icon(Icons.info),
                const Text('App Version'),
                (() => showAboutDialog(
                        context: context,
                        applicationName: controller.APPNAME,
                        applicationVersion: controller.APPVERSION,
                        applicationIcon: Image.asset(
                          'assets/icons/app_logo.png',
                          height: 75,
                          width: 75,
                        ),
                        children: [
                          Text(
                            controller.APPDESCRIPTION,
                          )
                        ])),
              ),
            ],
          ),
        ));
  }

  _itemTile(Widget iconLead, Text title, VoidCallback link) {
    return ListTile(
      leading: iconLead,
      title: title,
      onTap: link,
    );
  }
}
