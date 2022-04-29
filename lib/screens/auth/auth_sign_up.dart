import 'dart:convert';

import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:the_hill_residence/controllers/theme_service_controller.dart';
import "package:the_hill_residence/shared/my_fill_primary_btn.dart";
import 'package:the_hill_residence/shared/my_outline_button.dart';
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/widgets/auth_other_provider_options.dart";
import "package:the_hill_residence/widgets/auth_textfield_email.dart";
import "package:the_hill_residence/widgets/auth_textfield_password.dart";

class AuthSignUp extends StatelessWidget {
  MyThemeServiceController themeService = Get.find<MyThemeServiceController>();

  AuthSignUp({Key? key}) : super(key: key);

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
                            title: "Sign up", appBarType: MyAppBarType.back),
                        SizedBox(height: 30),
                        Expanded(flex: 1, child: Container()),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            maxLines: 3,
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 39,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Nunito",
                                    height: 1.1),
                              ),
                              TextSpan(
                                text: " with a new account",
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
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "What's your email?",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                color: themeService.textColor54,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                        SizedBox(height: 20),
                        Form(
                          child: Column(
                            children: [
                              AuthTextFieldEmail(),
                              // SizedBox(height: 20),
                              // AuthTextFieldPassword(),
                              SizedBox(height: 30),
                              MyFillButton(
                                text: "Continue with email",
                                color: Theme.of(context).primaryColor,
                                onPressFunc: null,
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
                                text: "Sign up with google",
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
