import "package:flutter/material.dart";
import 'package:the_hill_residence/screens/settings/widgets/settings_item.dart';
import "package:the_hill_residence/screens/settings/widgets/settings_appBar.dart";
import "package:the_hill_residence/screens/settings/widgets/settings_square_item.dart";
import "package:the_hill_residence/screens/v-registration/pages/vreg_contact.dart";
import "package:the_hill_residence/shared/my_bottom_navbar.dart";
import "package:the_hill_residence/shared/my_fab.dart";
import "package:the_hill_residence/utilities/navigation.dart";

class SettingsMain extends StatelessWidget {
  const SettingsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Row(
                    children: [
                      SettingsSquareItem(
                        icon: Icons.verified_rounded,
                        title: "T&C, Policies",
                        description: "Guidelines and more...",
                        onPressedFunc: navigateToSettingsInfo,
                      ),
                      SizedBox(width: 15),
                      SettingsSquareItem(
                        icon: Icons.help,
                        title: "FAQ, Support",
                        description: "Do you need help?",
                        onPressedFunc: navigateToSettingsFAQ,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  MySettingsItem(
                    itemIcon: Icons.dark_mode_rounded,
                    text: "Dark theme",
                    itemAction: MySettingsItemAction.toggle,
                  ),
                  SizedBox(height: 15),
                  MySettingsItem(
                    itemIcon: Icons.lock,
                    text: "Security",
                  ),
                  SizedBox(height: 15),
                  MySettingsItem(
                    itemIcon: Icons.notifications,
                    text: "Notifications",
                  ),
                  SizedBox(height: 15),
                  MySettingsItem(
                    itemIcon: Icons.error_rounded,
                    text: "Report a problem",
                  ),
                  SizedBox(height: 15),
                  MySettingsItem(
                    itemIcon: Icons.bookmark,
                    text: "Special thanks",
                  ),
                  SizedBox(height: 15),
                  MySettingsItem(
                    itemIcon: Icons.logout_rounded,
                    text: "Logout",
                    color: Colors.red[800],
                    itemAction: MySettingsItemAction.none,
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
