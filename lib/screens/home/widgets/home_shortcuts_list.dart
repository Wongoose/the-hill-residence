import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/screens/admin/pages/admin_main.dart";
import "package:the_hill_residence/screens/home/open_gates.dart";
import "package:the_hill_residence/screens/v-registration/pages/vreg_contact.dart";
import "package:the_hill_residence/widgets/shortcut_item.dart";

class HomeShortcutsList extends StatelessWidget {
  const HomeShortcutsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () => Get.to(() => OpenGatesScreen()),
                    child: ShortcutWidget(
                        icon: Icons.key_rounded, text: "Open gate")),
                SizedBox(width: 25),
                GestureDetector(
                  onTap: () => Get.to(() => VRegContact()),
                  child: ShortcutWidget(
                      icon: Icons.app_registration_rounded,
                      text: "Register visitor"),
                ),
                SizedBox(width: 25),
                GestureDetector(
                  onTap: () => Get.to(() => AdminMainPage()),
                  child: ShortcutWidget(
                      icon: Icons.admin_panel_settings, text: "Manage system"),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
