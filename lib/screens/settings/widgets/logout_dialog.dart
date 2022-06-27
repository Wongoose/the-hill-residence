import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";

class LogoutDialog extends StatelessWidget {
  final MyThemeServiceController themeService = Get.find(tag: "themeService");

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      insetPadding: EdgeInsets.symmetric(horizontal: 60),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(32, 22, 32, 22),
          child: MyTextBolded("Confirm logout?", fontSize: 24),
        ),
        Container(
          margin: EdgeInsets.all(0),
          width: MediaQuery.of(context).size.width,
          height: 60,
          color: Colors.transparent,
          child: TextButton(
            onPressed: () {},
            child: MyTextBolded(
              "Logout",
              color: Colors.red,
            ),
          ),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.all(0),
          width: MediaQuery.of(context).size.width,
          height: 60,
          color: Colors.transparent,
          child: TextButton(
            onPressed: () {},
            child: MyText(
              "Cancel",
              color: themeService.textColor54,
            ),
          ),
        ),
      ]),
    );
  }
}
