import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";

class ShortcutWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool enabled;
  const ShortcutWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: enabled ? Theme.of(context).primaryColor.withOpacity(0.1) : themeService.textColor12,
                ),
              ),
              Icon(
                icon,
                size: 40,
                color: enabled ? Theme.of(context).primaryColor.withOpacity(0.9) : themeService.textColor45,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            enabled ?text : "No access",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
              color: enabled? themeService.textColor70 : themeService.textColor26,
            ),
          ),
        ],
      ),
    );
  }
}
