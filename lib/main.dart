import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";
import "package:the_hill_residence/screens/auth/pages/auth_home.dart";
import "package:the_hill_residence/screens/home/splash_screen.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/utilities/delay.dart";
import "package:overlay_support/overlay_support.dart";

void main() async {
  await GetStorage.init();
  runApp(const TheHillApp());
}

class TheHillApp extends StatelessWidget {
  const TheHillApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    return OverlaySupport.global(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "The-Hill Residence",
        themeMode: MyThemeServiceController().themeMode,
        theme: MyThemeServiceController.light,
        darkTheme: MyThemeServiceController.dark,
        home: FutureBuilder(
          future: delaySeconds(3),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("main.dart | FutureBuilder error: ${snapshot.error}");
            } else if (snapshot.connectionState == ConnectionState.done) {
              print("FutureBuilder success with dark mode: ${Get.isDarkMode}");
              return AuthHome();
            }
            // while loading show Splash
            return SplashScreen();
          },
        ),
      ),
    );
  }
}
