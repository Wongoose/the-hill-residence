import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";

class MyBottomNavBar extends StatelessWidget {
  final PageController pageController;
  const MyBottomNavBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return SizedBox(
      height: 65,
      child: Obx(() {
        return BottomAppBar(
          elevation: 5,
          notchMargin: 5,
          shape: CircularNotchedRectangle(),
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: EdgeInsets.fromLTRB(45, 2, 45, 8),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          pageController.jumpToPage(0);
                        },
                        child: Icon(Icons.home,
                            color: themeService.homePageSelected.value
                                ? Theme.of(context).primaryColor
                                : themeService.textColor54,
                            size: 35)),
                  ),
                  Expanded(child: Text("")),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(1);
                      },
                      child: Icon(
                        Icons.settings,
                        color: themeService.homePageSelected.value
                            ? themeService.textColor54
                            : Theme.of(context).primaryColor,
                        size: 35,
                      ),
                    ),
                  ),
                ]),
          ),
        );
      }),
    );
  }
}
