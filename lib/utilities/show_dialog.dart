import "package:get/get.dart";
import "package:the_hill_residence/screens/settings/widgets/logout_dialog.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_confirm_visitor_dialog.dart";

Future showLogoutDialog() async {
  return Get.dialog(LogoutDialog());
}

Future showConfirmVisitorDialog() async {
  return Get.dialog(ConfirmVisitorDialog());
}