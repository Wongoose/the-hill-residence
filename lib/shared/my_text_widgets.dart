import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";

class MyText extends StatelessWidget {
  final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  MyText(this.text, {Key? key, this.color, this.fontSize, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w500,
        fontFamily: "Nunito",
        color: color ?? themeService.textColor,
      ),
    );
  }
}

class MyTextBolded extends StatelessWidget {
  final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;

  MyTextBolded(this.text, {this.color, this.fontSize, Key? key, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w700,
        fontFamily: "Nunito",
        color: color ?? themeService.textColor,
      ),
    );
  }
}
