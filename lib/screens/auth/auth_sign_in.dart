import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:get/get.dart";
import 'package:the_hill_residence/controllers/theme_service_controller.dart';
import "package:the_hill_residence/screens/auth/auth_reset_password.dart";
import "package:the_hill_residence/shared/my_fill_primary_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import 'package:the_hill_residence/utilities/navigation.dart';
import "package:the_hill_residence/widgets/auth_other_provider_options.dart";
import "package:the_hill_residence/widgets/auth_textfield_email.dart";
import "package:the_hill_residence/widgets/auth_textfield_password.dart";

class AuthSignIn extends StatelessWidget {
  AuthSignIn({Key? key}) : super(key: key);
  final MyThemeServiceController themeService =
      Get.put(MyThemeServiceController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: true,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(35, 32, 35, 22),
                    child: Column(
                      children: [
                        MyPageAppBar(
                            title: "Login", appBarType: MyAppBarType.back),
                        SizedBox(height: 30),
                        Expanded(flex: 1, child: Container()),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            maxLines: 2,
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Login",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 39,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Nunito",
                                    height: 1.1),
                              ),
                              TextSpan(
                                text: " to your account",
                                style: TextStyle(
                                    color: themeService.textColor,
                                    fontSize: 39,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Nunito",
                                    height: 1.1),
                              )
                            ]),
                          ),
                        ),
                        Form(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              AuthTextFieldEmail(),
                              SizedBox(height: 20),
                              AuthTextFieldPassword(),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 7, 5, 0),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      // resetPasswordDialog(context);
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           ScreenResetPassword(
                                      //         initialEmail:
                                      //             emailTextController.text,
                                      //         editAccess: true,
                                      //       ),
                                      //     ));
                                    },
                                    child: GestureDetector(
                                      onTap: () => Get.to(
                                        () => ResetPassword(),
                                      ),
                                      child: SizedBox(
                                        child: Text(
                                          "Forgot password?",
                                          style: TextStyle(
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.underline,
                                            color: themeService.textColor87,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              MyFillButton(
                                text: "Login with email",
                                color: Theme.of(context).primaryColor,
                                onPressFunc: navigateOffAllHome,
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      endIndent: 10,
                                      color: themeService.textColor26,
                                    ),
                                  ),
                                  Text(
                                    "or",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        color: themeService.textColor54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      indent: 10,
                                      color: themeService.textColor26,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              MyFillButton(
                                text: "Login with google",
                                color: Color(0xFFedf8fc),
                                textColor: Colors.black87,
                                icon: Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.red[400],
                                  size: 20,
                                ),
                                onPressFunc: null,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
