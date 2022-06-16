import "package:flutter/material.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_textfield_email.dart";
import "package:the_hill_residence/shared/my_fill_primary_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_center_display.dart";
import "package:the_hill_residence/utilities/navigation.dart";

class ResetPassword extends StatelessWidget {
  Future<dynamic> resetPassword() async {
    //firebase reset password function
    navigateToOpenInboxScreen(null);
  }

  @override
  Widget build(BuildContext context) {
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
                    MyPageAppBar(
                        title: "Alert", appBarType: MyAppBarType.xmark),
                    SizedBox(height: 30),
                    Expanded(child: Container()),
                    VRegCenterImageText(
                      imagePath: "assets/images/reset-password.png",
                      title: "Reset password",
                      description: "Confirm your email to reset password.",
                    ),
                    Expanded(child: Container()),
                    SizedBox(height: 30),
                    AuthTextFieldEmail(),
                    SizedBox(height: 20),
                    MyFillButton(
                      text: "Reset password",
                      color: Theme.of(context).primaryColor,
                      onPressFunc: resetPassword,
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
