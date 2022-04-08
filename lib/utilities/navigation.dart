import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the_hill_residence/screens/settings/pages/settings_information.dart';

Future navigateToSettingsInfo() async {
  return await Get.to(() => SettingsInformationPage());
}
