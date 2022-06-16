import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";

class MyExpandedButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onPressFunc;
  final MyThemeServiceController themeService =
      Get.find<MyThemeServiceController>();

  MyExpandedButton({
    Key? key,
    required this.text,
    this.onPressFunc,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: color ?? Theme.of(context).primaryColor,
      child: TextButton(
        onPressed: onPressFunc ?? () => Get.back(),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Nuinito",
          ),
        ),
      ),
    );
  }
}
