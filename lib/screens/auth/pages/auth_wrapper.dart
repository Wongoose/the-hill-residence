import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/auth/pages/auth_home.dart";
import "package:the_hill_residence/screens/create_account/pages/create_acc_home.dart";
import "package:the_hill_residence/screens/home/home.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/shared/open_inbox.dart";

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

    if (authService.appUser.uid == null) {
      return (AuthHome());
    } else if (!authService.appUser.hasProfileDetails) {
      return (CreateAccHome(accountEmail: authService.appUser.email!));
    } else if (!authService.appUser.isVerified) {
      return OpenInboxScreen(
          voidFunction: authService.sendVerificationEmail,
          appUser: authService.appUser,
          description:
              "A verification email was sent to ${authService.appUser.email}. If you do not see the email in a few minutes, check your junk mail or spam folder.");
    } else {
      print("Name: ${authService.appUser.fullName}");
      return (Home());
    }
  }
}
