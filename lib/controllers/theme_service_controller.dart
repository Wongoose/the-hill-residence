import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";

class MyThemeServiceController extends GetxController {
  // define light and dark theme data
  static final ThemeData light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: Color(0xFF34A382),
    accentColor: Color(0xff4DB8DE),
    scaffoldBackgroundColor: Color(0xFFedf8fc),
    splashColor: Color(0xFF072227),
    cardColor: Color(0xFF40514E),
    colorScheme: ColorScheme.light(secondary: Color(0xff4DB8DE)),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    primaryColor: Color(0xFF34A382),
    accentColor: Color(0xff4DB8DE),
    scaffoldBackgroundColor: Color(0xFF1c1b1b),
    splashColor: Color(0xFF072227),
    cardColor: Color(0xFF40514E),
  );

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
  Color get textColor87 => _cacheIsDarkMode ? Colors.white.withOpacity(0.87) : Colors.black87;
  Color get textColor70 => _cacheIsDarkMode ? Colors.white.withOpacity(0.70) : Colors.black.withOpacity(0.7);
  Color get textColor54 => _cacheIsDarkMode ? Colors.white.withOpacity(0.54) : Colors.black54;
  Color get textColor26 => _cacheIsDarkMode ? Colors.white.withOpacity(0.26) : Colors.black26;
  Color get textColor12 => _cacheIsDarkMode ? Colors.white.withOpacity(0.12) : Colors.black12;
}
