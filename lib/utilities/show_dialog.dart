import 'package:get/get.dart';
import 'package:the_hill_residence/shared/vreg_confirm_visitor_dialog.dart';

Future showConfirmVisitorDialog() async {
  return Get.dialog(ConfirmVisitorDialog());
}
