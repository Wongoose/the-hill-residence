import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";

class MyText extends StatelessWidget {
  final MyThemeServiceController themeService = Get.find(tag: "themeService");
  final String text;
  final Color? color;
  final double? fontSize;
  MyText(this.text, {this.color, this.fontSize, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w500,
        color: color ?? themeService.textColor,
      ),
    );
  }
}

class MyTextBolded extends StatelessWidget {
  final MyThemeServiceController themeService = Get.find(tag: "themeService");
  final String text;
  final Color? color;
  final double? fontSize;
  MyTextBolded(this.text, {this.color, this.fontSize, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w700,
        color: color ?? themeService.textColor,
      ),
    );
  }
}
