import "package:flutter/material.dart";
import "package:the_hill_residence/shared/my_fill_primary_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import 'package:the_hill_residence/widgets/auth_other_provider_options.dart';
import "package:the_hill_residence/widgets/auth_textfield_email.dart";
import "package:the_hill_residence/widgets/auth_textfield_password.dart";

class AuthSignUp extends StatelessWidget {
  const AuthSignUp({Key? key}) : super(key: key);

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
                            title: "Sign Up", appBarType: MyAppBarType.back),
                        SizedBox(height: 30),
                        Expanded(flex: 1, child: Container()),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 250,
                            child: RichText(
                              maxLines: 2,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "Create",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 39,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Nunito",
                                      height: 1.1),
                                ),
                                TextSpan(
                                  text: " an Account",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 39,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Nunito",
                                      height: 1.1),
                                )
                              ]),
                            ),
                          ),
                        ),
                        Form(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              AuthTextFieldEmail(),
                              SizedBox(height: 20),
                              AuthTextFieldPassword(),
                              SizedBox(height: 30),
                              MyFillButton(
                                text: "Create account",
                                color: Theme.of(context).primaryColor,
                                onPressFunc: null,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(height: 15),
                        OtherAuthProviderOptions(text: "Other Sign Up options"),
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
