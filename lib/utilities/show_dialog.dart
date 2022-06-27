import "package:get/get.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_confirm_visitor_dialog.dart";
import "package:the_hill_residence/shared/my_confirm_dialog.dart";

Future showVRegCancelDialog() async {
  print("Visitor cancel dialog was called!");
  return Get.dialog(MyConfirmDialog(
      title: "Discard registration?",
      body: "Registration data will be lost if you proceed.",
      actionText: "Discard"));
}

Future showLogoutDialog() async {
  return Get.dialog(MyConfirmDialog(
      title: "Confirm logout?",
      body: "Are you sure to logout of this account?",
      actionText: "Logout"));
}

Future showConfirmVisitorDialog() async {
  return Get.dialog(ConfirmVisitorDialog());
}
