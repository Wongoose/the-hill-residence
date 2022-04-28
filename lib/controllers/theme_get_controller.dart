import "package:flutter/material.dart";
import "package:get/get.dart";

class ThemeGetController extends GetxController {
  Color primaryTextColor = Get.isDarkMode ? Colors.white : Colors.black;
  Color secondaryTextColor = Get.isDarkMode ? Colors.white : Colors.black54;
  String text = "hello";

  void toggleTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    primaryTextColor = Get.isDarkMode ? Colors.white : Colors.black;
    secondaryTextColor = Get.isDarkMode ? Colors.white : Colors.black54;
    update();
    print("Them toggled and updated!");
  }
}
