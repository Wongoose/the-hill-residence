import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the_hill_residence/screens/settings/pages/settings_page_faq.dart';
import 'package:the_hill_residence/screens/settings/pages/settings_page_information.dart';

Future navigateToSettingsInfo() async {
  return await Get.to(() => SettingsInformationPage());
}

Future navigateToSettingsFAQ() async {
  return await Get.to(() => SettingsFAQPage());
}
