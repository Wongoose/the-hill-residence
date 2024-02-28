import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/shared/my_theme_divider.dart";

class AuthSignInOptionDivider extends StatelessWidget {
  final MyThemeServiceController themeService =
      Get.find<MyThemeServiceController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ThemedDivider(
            thickness: 1,
            endIndent: 10,
            color: themeService.textColor26,
          ),
        ),
        Text(
          "or",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Nunito",
              color: themeService.textColor54,
              fontWeight: FontWeight.w400,
              fontSize: 16),
        ),
        Expanded(
          child: ThemedDivider(
            thickness: 1,
            indent: 10,
            color: themeService.textColor26,
          ),
        ),
      ],
    );
  }
}
