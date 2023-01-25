import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/home/home.dart";
import "package:the_hill_residence/screens/settings/pages/settings_main.dart";
import "package:the_hill_residence/shared/my_bottom_navbar.dart";
import "package:the_hill_residence/shared/my_fab.dart";

class HomeWrapper extends StatelessWidget {
  HomeWrapper({Key? key}) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
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
