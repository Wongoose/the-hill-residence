import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/screens/settings/pages/settings_page_password.dart";
import "package:the_hill_residence/screens/settings/pages/settings_report_problem.dart";
import "package:the_hill_residence/screens/settings/widgets/settings_item.dart";
import "package:the_hill_residence/screens/settings/widgets/settings_appbar.dart";
import "package:the_hill_residence/screens/settings/widgets/settings_square_item.dart";
import "package:the_hill_residence/shared/my_bottom_navbar.dart";
import "package:the_hill_residence/shared/my_fab.dart";
import "package:the_hill_residence/utilities/navigation.dart";
import "package:the_hill_residence/utilities/show_dialog.dart";

class SettingsMain extends StatelessWidget {
  final AutoSizeGroup squareItemAutoSizeGroup = AutoSizeGroup();
  SettingsMain({Key? key}) : super(key: key);

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SettingsSquareItem(
                        icon: Icons.verified_rounded,
                        title: "T&C, Policies",
                        description: "Find out more?",
                        onPressedFunc: navigateToSettingsInfo,
                        autoSizeGroup: squareItemAutoSizeGroup,
                      ),
                      SizedBox(width: 15),
                      SettingsSquareItem(
                        icon: Icons.help,
                        title: "FAQ, Support",
                        description: "Do you need help?",
                        onPressedFunc: navigateToSettingsFAQ,
                        autoSizeGroup: squareItemAutoSizeGroup,
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
                    text: "Password",
                    onPressed: () => Get.to(() => SettingsPasswordPage()),
                  ),
                  SizedBox(height: 15),
                  MySettingsItem(
                    itemIcon: Icons.error_rounded,
                    text: "Report a problem",
                    onPressed: () => Get.to(() => SettingsReportProblemPage()),
                  ),
                  SizedBox(height: 15),
                  MySettingsItem(
                    itemIcon: Icons.logout_rounded,
                    text: "Logout",
                    color: Colors.red[800],
                    itemAction: MySettingsItemAction.none,
                    onPressed: () => showLogoutDialog(),
                  ),
                ],
              ),
            ),
            SettingsAppBar(),
          ],
        ),
        floatingActionButton: MyFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }
}
