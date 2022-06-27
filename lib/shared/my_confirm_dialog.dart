import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";
import "package:the_hill_residence/utilities/navigation.dart";

class MyConfirmDialog extends StatelessWidget {
  final String title;
  final String body;
  final String actionText;
  final MyThemeServiceController themeService =
      Get.put(MyThemeServiceController());

  MyConfirmDialog({
    Key? key,
    required this.title,
    required this.body,
    required this.actionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      insetPadding: EdgeInsets.symmetric(horizontal: 60),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(height: 30),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: MyTextBolded(title, fontSize: 24)),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: MyText(body, textAlign: TextAlign.center)),
        SizedBox(height: 20),
        Container(
            margin: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Colors.transparent,
            child: TextButton(
                onPressed: () => navigateToAuthHome(),
                child: MyTextBolded(actionText, color: Colors.red))),
        Divider(height: 0),
        Container(
            margin: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Colors.transparent,
            child: TextButton(
                onPressed: () => Get.back(),
                child: MyText("Cancel", color: themeService.textColor54))),
      ]),
    );
  }
}
