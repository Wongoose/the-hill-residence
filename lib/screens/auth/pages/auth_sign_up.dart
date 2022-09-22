import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/sign_in_controller.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_richtext.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_sign_in_option_divider.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_textfield_email.dart";
import "package:the_hill_residence/shared/all_loading.dart";
import "package:the_hill_residence/shared/my_fill_primary_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";

class AuthSignUp extends StatefulWidget {
  const AuthSignUp({Key? key}) : super(key: key);

  @override
  State<AuthSignUp> createState() => _AuthSignUpState();
}

class _AuthSignUpState extends State<AuthSignUp> {
  final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

  final SignInController signInController = Get.put(SignInController());

  @override
  void initState() {
    super.initState();
    signInController.emailController.addListener(() {
      signInController.firstValidation ? null : signInController.validateEmail(only: true);
    });
  }

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
                        MyPageAppBar(title: "Sign up", appBarType: MyAppBarType.back),
                        SizedBox(height: 30),
                        Expanded(flex: 1, child: Container()),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AuthRichText(
                            coloredText: "Sign up",
                            text: " with a new account",
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
                        Form(
                          child: Column(
                            children: [
                              Obx(() {
                                return signInController.hasError
                                    ? Column(children: [
                                        SizedBox(height: 20),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(signInController.errMessage.string,
                                                style: TextStyle(
                                                  color: Colors.red[600],
                                                ))),
                                      ])
                                    : Container();
                              }),
                              SizedBox(height: 20),
                              AuthTextFieldEmail(
                                emailController: signInController.emailController,
                              ),
                              // SizedBox(height: 20),
                              // AuthTextFieldPassword(),
                              SizedBox(height: 30),
                              Obx(
                                () {
                                  if (signInController.isLoading.isTrue) {
                                    return Padding(padding: EdgeInsets.all(20), child: CircleLoading(size: 1.5));
                                  } else {
                                    return MyFillButton(
                                      text: "Continue with email",
                                      color: Theme.of(context).primaryColor,
                                      onPressFunc: () => signInController.authEmailPassword(isSignIn: false),
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: 15),
                              AuthSignInOptionDivider(),
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
                                onPressFunc: () {},
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
