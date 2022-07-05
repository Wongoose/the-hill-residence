import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/admin/widgets/manage_acc_dialog_action_buttons.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";

class ManageAccDialog extends StatelessWidget {
  final MyThemeServiceController themeService = Get.find(tag: "themeService");
  ManageAccDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 60),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 30),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(children: [
                MyTextBolded("Manage account", fontSize: 24, textAlign: TextAlign.center),
                SizedBox(height: 25),
                Image(height: 80, width: 80, image: AssetImage("assets/images/face.png")),
                SizedBox(height: 15),
                MyTextBolded("John Doe", fontSize: 20, color: themeService.textColor70),
                SizedBox(height: 20),
                Row(children: [
                  Icon(Icons.phone, size: 14, color: Theme.of(context).primaryColor),
                  SizedBox(width: 7),
                  MyText("+6016-331 5288", fontSize: 14, color: Colors.black.withOpacity(0.7)),
                ]),
                SizedBox(height: 7),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(Icons.home, size: 15, color: Theme.of(context).primaryColor),
                  SizedBox(width: 7),
                  Flexible(
                      child: Text("26, Jalan Sutera 2, Jalil Sutera",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black.withOpacity(0.7)))),
                ]),
              ])),
          SizedBox(height: 25),
          Divider(height: 0),
          ManageAccDialogActionButtons(),
        ]));
  }
}
