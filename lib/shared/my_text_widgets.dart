import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";

class MyBodyText extends StatelessWidget {
  final MyThemeServiceController themeService = Get.find(tag: "themeService");
  final String text;
  final double? fontSize;
  MyBodyText(this.text, {this.fontSize, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w400,
        color: themeService.textColor,
      ),
    );
  }
}

class MyBodyTextBolded extends StatelessWidget {
  final MyThemeServiceController themeService = Get.find(tag: "themeService");
  final String text;
  MyBodyTextBolded(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: themeService.textColor,
      ),
    );
  }
}
