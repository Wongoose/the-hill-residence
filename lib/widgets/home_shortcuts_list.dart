import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/screens/pages/open_gates.dart";
import "package:the_hill_residence/screens/pages/vreg_contact.dart";
import "package:the_hill_residence/widgets/shortcut_item.dart";

class HomeShortcutsList extends StatelessWidget {
  const HomeShortcutsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Shortcuts",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).splashColor.withOpacity(0.7),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () => Get.to(() => OpenGatesScreen()),
                  child: ShortcutWidget(
                      icon: Icons.key_rounded, text: "Open gates")),
              SizedBox(width: 45),
              GestureDetector(
                onTap: () => Get.to(() => VRegContact()),
                child: ShortcutWidget(
                    icon: Icons.app_registration_rounded,
                    text: "Register visitor"),
              ),
              SizedBox(width: 45),
              ShortcutWidget(
                  icon: Icons.admin_panel_settings, text: "Admin center"),
            ],
          ),
        )
      ],
    );
  }
}
