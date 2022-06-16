import "package:get/get.dart";
import 'package:the_hill_residence/screens/create_account/pages/create_acc_home.dart';
import "package:the_hill_residence/screens/home/home.dart";
import "package:the_hill_residence/screens/profile/edit_address.dart";
import "package:the_hill_residence/screens/profile/edit_email.dart";
import "package:the_hill_residence/screens/profile/edit_username.dart";
import "package:the_hill_residence/screens/settings/pages/settings_page_faq.dart";
import "package:the_hill_residence/screens/settings/pages/settings_page_information.dart";
import "package:the_hill_residence/screens/settings/settings_main.dart";
import "package:the_hill_residence/screens/v-registration/pages/vreg_date.dart";
import "package:the_hill_residence/screens/v-registration/pages/vreg_share.dart";
import "package:the_hill_residence/shared/open_%20inbox.dart";

Future navigateToCreateAccHome() async {
  return await Get.to(() => CreateAccHome());
}

Future navigateToOpenInboxScreen(String? description) async {
  String defaultText =
      "We have sent a confirmation email to your inobx. Please follow the steps.";

  return await Get.to(
      () => OpenInboxScreen(description: description ?? defaultText));
}

Future navigateToSettingsInfo() async {
  return await Get.to(() => SettingsInformationPage());
}

Future navigateToSettingsFAQ() async {
  return await Get.to(() => SettingsFAQPage());
}

Future navigateToSettingsMain() async {
  return await Get.to(() => SettingsMain());
}

Future navigateToEditUsername() async {
  return await Get.to(() => EditUsernamePage());
}

Future navigateToEditEmail() async {
  return await Get.to(() => EditEmailPage());
}

Future navigateToEditAddress() async {
  return await Get.to(() => EditAddressPage());
}

Future navigateToVRegDate() async {
  return await Get.to(() => VRegDate());
}

Future navigateToVRegShare() async {
  return await Get.to(() => VRegShare());
}

Future navigateOffAllHome() async {
  return await Get.offAll(() => Home());
}
