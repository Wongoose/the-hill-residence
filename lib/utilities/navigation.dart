import "package:get/get.dart";
import "package:the_hill_residence/screens/auth/pages/auth_home.dart";
import "package:the_hill_residence/screens/create_account/pages/create_acc_address.dart";
import "package:the_hill_residence/screens/create_account/pages/create_acc_home.dart";
import "package:the_hill_residence/screens/home/home.dart";
import "package:the_hill_residence/screens/profile/edit_address.dart";
import "package:the_hill_residence/screens/profile/edit_email.dart";
import "package:the_hill_residence/screens/profile/edit_username.dart";
import "package:the_hill_residence/screens/settings/pages/settings_page_faq.dart";
import "package:the_hill_residence/screens/settings/pages/settings_page_information.dart";
import "package:the_hill_residence/screens/settings/pages/settings_main.dart";
import "package:the_hill_residence/screens/visitor_registration/pages/vreg_date.dart";
import 'package:the_hill_residence/screens/visitor_registration/pages/vreg_exit_date.dart';
import "package:the_hill_residence/screens/visitor_registration/pages/vreg_share.dart";
import "package:the_hill_residence/shared/open_inbox.dart";

Future navigateToAuthHome() async {
  return await Get.to(() => AuthHome());
}

Future navigateToCreateAccAddress() async {
  return await Get.to(() => CreateAccAddress());
}

Future navigateToCreateAccHome(String accountEmail) async {
  return await Get.to(() => CreateAccHome(accountEmail: accountEmail));
}

Future navigateToOpenInboxScreen(String? description) async {
  String defaultText =
      "We have sent a confirmation email to your inbox. Please follow the steps to complete this process.";

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

Future navigateToVRegExitDate() async {
  return await Get.to(() => VRegExitDate());
}

Future navigateToVRegShare() async {
  return await Get.to(() => VRegShare());
}

Future navigateOffAllHome() async {
  return await Get.offAll(() => Home());
}
