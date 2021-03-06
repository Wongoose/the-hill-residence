import "package:get/get.dart";
import "package:the_hill_residence/screens/admin/widgets/manage_acc_dialog.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_confirm_visitor_dialog.dart";
import "package:the_hill_residence/shared/my_confirm_dialog.dart";
import "package:the_hill_residence/utilities/navigation.dart";

Future showManageAccDialog() async {
  return Get.dialog(ManageAccDialog());
}

Future showVRegCancelDialog() async {
  return Get.dialog(MyConfirmDialog(
      title: "Discard info?",
      body: "Visitor's registration data will be lost if you proceed.",
      actionText: "Discard",
      actionFunction: () => navigateOffAllHome()));
}

Future showLogoutDialog() async {
  return Get.dialog(MyConfirmDialog(
      title: "Confirm logout?",
      body: "Are you sure to logout of this account?",
      actionText: "Logout",
      actionFunction: () => navigateToAuthHome()));
}

Future showConfirmVisitorDialog() async {
  return Get.dialog(ConfirmVisitorDialog());
}
