import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";

class MyThemeServiceController extends GetxController {
  // define light and dark theme data
  static final ThemeData light = ThemeData.light().copyWith(
    primaryColor: Color(0xFF34A382),
    scaffoldBackgroundColor: Color(0xFFedf8fc),
    splashColor: Color(0xFF072227),
    cardColor: Color(0xfff6fbfd),
    dialogBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Color(0xff4DB8DE),
      background: Colors.white,
    ),
    dividerColor: Colors.black54,
    hintColor: Colors.black54,
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Color(0xFF34A382),
    scaffoldBackgroundColor: Color(0xFF1a1a1a),
    splashColor: Color(0xFF072227),
    cardColor: Color(0xFF272525),
    dialogBackgroundColor: Color(0xFF272525),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Color(0xff4DB8DE),
      background: Color(0xFF1a1a1a),
    ),
    dividerColor: Colors.white.withOpacity(0.3),
    hintColor: Colors.white.withOpacity(0.49),
  );

  RxBool homePageSelected = true.obs;

  // persistent theme
  final GetStorage _container = GetStorage();
  late bool _cacheIsDarkMode;

  ThemeMode get themeMode {
    return _storageIsDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  bool get _storageIsDarkMode {
    _cacheIsDarkMode = _container.read("isDarkMode") ?? false;
    return _container.read("isDarkMode") ?? false;
  }

  @override
  void onInit() {
    super.onInit();
    _cacheIsDarkMode = _storageIsDarkMode;
  }

  void switchTheme() {
    Get.changeThemeMode(_storageIsDarkMode ? ThemeMode.light : ThemeMode.dark);
    _container.write("isDarkMode", !_storageIsDarkMode);

    _cacheIsDarkMode = _storageIsDarkMode;
    print("Switched theme mode to: ${_storageIsDarkMode ? "Dark" : "Light"}");
  }

  // getx variables
  Color get textColor => _cacheIsDarkMode ? Colors.white.withOpacity(0.95) : Colors.black;
  Color get textColor87 => _cacheIsDarkMode ? Colors.white.withOpacity(0.82) : Colors.black87;
  Color get textColor70 => _cacheIsDarkMode ? Colors.white.withOpacity(0.65) : Colors.black.withOpacity(0.7);
  Color get textColor54 => _cacheIsDarkMode ? Colors.white.withOpacity(0.49) : Colors.black54;
  Color get textColor45 => _cacheIsDarkMode ? Colors.white.withOpacity(0.40) : Colors.black45;
  Color get textColor26 => _cacheIsDarkMode ? Colors.white.withOpacity(0.21) : Colors.black26;
  Color get textColor12 => _cacheIsDarkMode ? Colors.white.withOpacity(0.05) : Colors.black12;
}
