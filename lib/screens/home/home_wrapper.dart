import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/home/home.dart";
import "package:the_hill_residence/screens/settings/pages/settings_main.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/shared/my_bottom_navbar.dart";
import "package:the_hill_residence/shared/my_confirm_dialog.dart";
import "package:the_hill_residence/shared/my_fab.dart";

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  final PageController pageController = Get.put(PageController(initialPage: 0));
  final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
  final AuthService authService = Get.put(AuthService());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (authService.appUser.isGuest) {
        Get.dialog(MyConfirmDialog(
          title: "Guest",
          body: "You are not registered under any unit. Your access may be limited.",
          actionText: "Continue as guest",
          actionFunction: () => Get.back(),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (value) => themeService.homePageSelected.value = (value == 0),
          children: [
            Home(),
            SettingsMain(),
          ],
        ),
        floatingActionButton: MyFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyBottomNavBar(pageController: pageController),
      ),
    );
  }
}
