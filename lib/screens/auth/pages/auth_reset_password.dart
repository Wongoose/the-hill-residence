import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/screens/auth/pages/auth_sign_in.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_textfield_email.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/shared/my_confirm_dialog.dart";
import "package:the_hill_residence/shared/my_fill_primary_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_center_display.dart";
import "package:the_hill_residence/shared/open_inbox.dart";

class ResetPassword extends StatelessWidget {
  final String? email;
  final TextEditingController textController = TextEditingController();

  ResetPassword({Key? key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find();
    textController.text = email ?? "";
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 32, 35, 32),
                child: Column(
                  children: [
                    MyPageAppBar(title: "Alert", appBarType: MyAppBarType.xmark),
                    SizedBox(height: 30),
                    Expanded(child: Container()),
                    VRegCenterImageText(
                      imagePath: "assets/images/reset-password.png",
                      title: "Reset password",
                      description: "Confirm your email to reset password.",
                    ),
                    Expanded(child: Container()),
                    SizedBox(height: 30),
                    AuthTextFieldEmail(emailController: textController),
                    SizedBox(height: 20),
                    MyFillButton(
                      text: "Reset password",
                      color: Theme.of(context).primaryColor,
                      onPressFunc: () => Get.to(
                        () => OpenInboxScreen(
                          initFunction: () => authService.sendPasswordResetEmail(email: textController.text.trim()),
                          description:
                              "A password reset email was sent to ${textController.text.trim()}.  If you do not see the email in a few minutes, check your junk mail or spam folder.",
                          completedMessage: "Click here after resetting your password",
                          completeFunction: () => Get.dialog(MyConfirmDialog(
                              title: "Password changed",
                              body: "Please login again with your new password.",
                              actionText: "Login",
                              actionFunction: () =>
                                  Get.offAll(() => AuthSignIn(preEmail: textController.text.trim())))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
