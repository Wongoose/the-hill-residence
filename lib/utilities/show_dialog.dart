import "package:get/get.dart";
import "package:the_hill_residence/models/model_visitor.dart";
import "package:the_hill_residence/screens/admin/widgets/manage_acc_dialog.dart";
import "package:the_hill_residence/screens/admin/widgets/manage_unit_dialog.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_confirm_visitor_dialog.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/shared/my_confirm_dialog.dart";

Future showManageUnitDialog() async {
  return Get.dialog(ManageUnitDialog());
}

Future showManageAccDialog() async {
  return Get.dialog(ManageAccDialog());
}

Future showLogoutDialog(AuthService authService) async {
  return Get.dialog(MyConfirmDialog(
      title: "Confirm logout?",
      body: "Are you sure to logout of this account?",
      actionText: "Logout",
      actionFunction: () {
        authService.logout();
      }));
}

Future showConfirmVisitorDialog(Visitor visitor) async {
  return Get.dialog(ConfirmVisitorDialog(visitor: visitor));
}
