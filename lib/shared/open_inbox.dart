import "package:flutter/material.dart";
import 'package:get/get.dart';
import "package:overlay_support/overlay_support.dart";
import 'package:the_hill_residence/models/model_user.dart';
import 'package:the_hill_residence/screens/auth/pages/auth_sign_in.dart';
import 'package:the_hill_residence/screens/auth/pages/auth_wrapper.dart';
import 'package:the_hill_residence/shared/my_confirm_dialog.dart';
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_center_display.dart";
import "package:the_hill_residence/utilities/navigation.dart";
import "package:open_mail_app/open_mail_app.dart";

class OpenInboxScreen extends StatefulWidget {
  final String description;
  final AppUser? appUser;
  final VoidCallback? voidFunction;

  const OpenInboxScreen({required this.description, this.voidFunction, this.appUser});

  @override
  State<OpenInboxScreen> createState() => _OpenInboxScreenState();
}

class _OpenInboxScreenState extends State<OpenInboxScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.voidFunction != null) widget.voidFunction!();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(35, 32, 35, 22),
          child: Column(
            children: [
              MyPageAppBar(title: "Alert", appBarType: MyAppBarType.xmark),
              Expanded(child: Container()),
              VRegCenterImageText(
                imagePath: "assets/images/inbox.png",
                title: "Check your inbox",
                description: widget.description,
              ),
              Expanded(child: Container()),
              SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onPressed: () async {
                    final OpenMailAppResult result = await OpenMailApp.openMailApp();
                    if (!result.didOpen && !result.canOpen) {
                      // NEXT: Decide use toast or Get.snackbar
                      toast("Oops! No mail apps installed.");
                    } else if (!result.didOpen && result.canOpen) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return MailAppPickerDialog(
                            mailApps: result.options,
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    "Open email app",
                    style: TextStyle(
                      // shadows: [
                      //   Shadow(
                      //       color: Colors.black26,
                      //       blurRadius: 10,
                      //       offset: Offset(0.5, 0.5))
                      // ],
                      fontFamily: "Nunito",
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () => Get.dialog(MyConfirmDialog(
                    title: "Create account complete",
                    body: "Once you have verified your email address, you can login to your account.",
                    actionText: "Login",
                    actionColor: Theme.of(context).accentColor,
                    actionFunction: () => Get.offAll(() => AuthSignIn(preEmail: widget.appUser?.email)))),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    "Click here after you have verified your email",
                    style: TextStyle(
                        fontFamily: "Nunito",
                        decoration: TextDecoration.underline,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
