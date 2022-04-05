import "package:flutter/material.dart";
import "package:the_hill_residence/screens/pages/vreg_contact.dart";
import "package:the_hill_residence/screens/settings/settings_appBar.dart";
import "package:the_hill_residence/screens/settings/settings_square_item.dart";
import "package:the_hill_residence/shared/my_bottom_navbar.dart";
import "package:the_hill_residence/shared/my_fab.dart";
import "package:the_hill_residence/shared/my_settings_item.dart";

class SettingsMain extends StatelessWidget {
  const SettingsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(22, 32, 22, 22),
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Row(
                    children: [
                      SettingsSquareItem(
                        icon: Icons.verified_rounded,
                        title: "T&C, Policies",
                        description: "Guidelines and more...",
                      ),
                      SizedBox(width: 20),
                      SettingsSquareItem(
                        icon: Icons.help,
                        title: "FAQ, Support",
                        description: "Do you need help?",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  MySettingsItem(
                    itemIcon: Icons.dark_mode_rounded,
                    text: "Dark theme",
                  ),
                  SizedBox(height: 20),
                  MySettingsItem(
                    itemIcon: Icons.lock,
                    text: "Security",
                  ),
                  SizedBox(height: 20),
                  MySettingsItem(
                    itemIcon: Icons.notifications,
                    text: "Notifications",
                  ),
                  SizedBox(height: 20),
                  MySettingsItem(
                    itemIcon: Icons.error_rounded,
                    text: "Report a problem",
                  ),
                  SizedBox(height: 20),
                  MySettingsItem(
                    itemIcon: Icons.bookmark,
                    text: "Special thanks",
                  ),
                  SizedBox(height: 20),
                  MySettingsItem(
                    itemIcon: Icons.logout_rounded,
                    text: "Logout",
                  ),
                ],
              ),
            ),
            SettingsAppBar(),
          ],
        ),
        floatingActionButton: MyFAB(navToWidget: VRegContact()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }
}
