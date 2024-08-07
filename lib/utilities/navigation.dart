import "package:get/get.dart";
import "package:the_hill_residence/screens/auth/pages/auth_home.dart";
import "package:the_hill_residence/screens/auth/pages/auth_wrapper.dart";
import "package:the_hill_residence/screens/create_account/pages/create_acc_address.dart";
import "package:the_hill_residence/screens/create_account/pages/create_acc_home.dart";
import "package:the_hill_residence/screens/home/home_wrapper.dart";
import "package:the_hill_residence/screens/home/splash_screen.dart";
import "package:the_hill_residence/screens/profile/pages/edit_address.dart";
import "package:the_hill_residence/screens/profile/pages/edit_email.dart";
import "package:the_hill_residence/screens/profile/pages/edit_username.dart";
import "package:the_hill_residence/screens/settings/pages/privacy_policy.dart";
import "package:the_hill_residence/screens/settings/pages/settings_page_faq.dart";
import "package:the_hill_residence/screens/settings/pages/settings_page_information.dart";
import "package:the_hill_residence/screens/settings/pages/settings_main.dart";
import "package:the_hill_residence/screens/settings/pages/terms_and_conditions.dart";
import "package:the_hill_residence/screens/visitor_registration/pages/vreg_date.dart";
import "package:the_hill_residence/screens/visitor_registration/pages/vreg_exit_date.dart";

Future navigateToPrivacyPolicy() async {
  return await Get.to(() => PrivacyPolicyPage());
}

Future navigateToTermsAndConditions() async {
  return await Get.to(() => TermsAndConditionsPage());
}

Future navigateOffAllAuthHome() async {
  return await Get.offAll(() => AuthHome(), transition: Transition.native);
}

Future navigateToCreateAccAddress() async {
  return await Get.to(() => CreateAccAddress());
}

Future navigateToCreateAccHome(String accountEmail) async {
  return await Get.to(() => CreateAccHome(accountEmail: accountEmail));
}

Future navigateToSettingsInfo() async {
  return await Get.to(() => SettingsInformationPage());
}

Future navigateToSettingsFAQ() async {
  return await Get.to(() => SettingsFAQPage());
}

Future navigateToSettingsMain() async {
  return await Get.to(() => SettingsMain(), transition: Transition.noTransition);
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
  return await Get.to(() => VRegDate(), transition: Transition.rightToLeftWithFade);
}

Future navigateToVRegExitDate() async {
  return await Get.to(() => VRegExitDate());
}

Future navigateOffAllHome() async {
  return await Get.offAll(() => HomeWrapper(), transition: Transition.noTransition);
}

Future navigateOffAllWrapper() async {
  return await Get.offAll(() => AuthWrapper(), transition: Transition.noTransition);
}

Future navigateToSplashScreen() async {
  return await Get.to(() => SplashScreen());
}
