import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/screens/auth/pages/auth_sign_in.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/shared/my_confirm_dialog.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";
import "package:the_hill_residence/shared/open_inbox.dart";

class SettingsPasswordPage extends StatelessWidget {
  const SettingsPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find();

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyPageAppBar(title: "Password", appBarType: MyAppBarType.xmark),
            SizedBox(height: 40),
            MyText("The password for this account is secured."),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () => Get.dialog(MyConfirmDialog(
                  title: "Warning",
                  body: "Are you sure that you want to change your password?",
                  actionText: "Yes, change password",
                  actionFunction: () => Get.to(() => OpenInboxScreen(
                        initFunction: () => authService.sendPasswordResetEmail(email: authService.appUser.email!),
                        description:
                            "A password reset email was sent to ${authService.appUser.email}.  If you do not see the email in a few minutes, check your junk mail or spam folder.",
                        completedMessage: "Click here after resetting your password",
                        completeFunction: () => Get.dialog(MyConfirmDialog(
                            title: "Password changed",
                            body: "Please login again with your new password.",
                            actionText: "Login",
                            actionFunction: () => Get.offAll(() => AuthSignIn(preEmail: authService.appUser.email)))),
                      )))),
              child: Text(
                "Change password?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
