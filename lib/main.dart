import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";
import "package:the_hill_residence/screens/auth/pages/auth_wrapper.dart";
import "package:the_hill_residence/screens/home/splash_screen.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/services/firebase/firestore.dart";
import "package:the_hill_residence/utilities/delay.dart";
import "package:overlay_support/overlay_support.dart";
import "package:firebase_core/firebase_core.dart";
import "firebase_options.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(DatabaseService());
  Get.put(AuthService());
  runApp(TheHillApp());
}

class TheHillApp extends StatelessWidget {
  const TheHillApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return OverlaySupport.global(
      child: GetMaterialApp(
        transitionDuration: Duration(milliseconds: 300),
        defaultTransition: Transition.rightToLeft,
        debugShowCheckedModeBanner: false,
        title: "The-Hill Residence",
        themeMode: MyThemeServiceController().themeMode,
        theme: MyThemeServiceController.light,
        darkTheme: MyThemeServiceController.dark,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
            child: child!,
          );
        },
        home: FutureBuilder(
          future: delaySeconds(3),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("main.dart | FutureBuilder error: ${snapshot.error}");
            } else if (snapshot.connectionState == ConnectionState.done) {
              print("FutureBuilder success with dark mode: ${Get.isDarkMode}");
              return AuthWrapper();
            }
            // while loading show Splash
            return SplashScreen();
          },
        ),
      ),
    );
  }
}
