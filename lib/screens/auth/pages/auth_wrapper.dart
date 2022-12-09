import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/auth/pages/auth_home.dart";
import "package:the_hill_residence/screens/create_account/pages/create_acc_home.dart";
import "package:the_hill_residence/screens/home/home.dart";
import "package:the_hill_residence/services/firebase/auth.dart";

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    AuthService authService = Get.find<AuthService>();
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
    // Check firestore account to determine
    // 1. Google provider no First Name, Last name ? Navigate to createAccHome
    if (authService.appUser.uid == null) {
      return (AuthHome());
    } else if (!authService.appUser.hasProfileDetails) {
      return (CreateAccHome(accountEmail: authService.appUser.email!));
    } else {
      print("Name: ${authService.appUser.firstName}");
      return (Home());
    }
  }
}
