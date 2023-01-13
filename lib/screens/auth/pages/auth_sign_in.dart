import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/sign_in_controller.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/auth/pages/auth_reset_password.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_sign_in_option_divider.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_richtext.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_textfield_email.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_textfield_password.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/shared/all_loading.dart";
import "package:the_hill_residence/shared/my_fill_primary_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import 'package:the_hill_residence/utilities/navigation.dart';

class AuthSignIn extends StatefulWidget {
  final String? preEmail;
  const AuthSignIn({Key? key, this.preEmail}) : super(key: key);

  @override
  State<AuthSignIn> createState() => _AuthSignInState();
}

class _AuthSignInState extends State<AuthSignIn> {
  final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
  final SignInController signInController = Get.put(SignInController());
  final AuthService authService = Get.put(AuthService());

  @override
  void initState() {
    super.initState();
    signInController.emailController
        .addListener(() => signInController.firstValidation ? null : signInController.validateEmailAndPassword());
    signInController.passwordController
        .addListener(() => signInController.firstValidation ? null : signInController.validateEmailAndPassword());
    signInController.emailController.text = widget.preEmail ?? "";
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
                        MyPageAppBar(
                          title: "Login",
                          appBarType: MyAppBarType.back,
                          backFunction: widget.preEmail != null ? navigateOffAllAuthHome : null,
                        ),
                        SizedBox(height: 30),
                        Expanded(flex: 1, child: Container()),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AuthRichText(
                            coloredText: "Login",
                            text: " to your account",
                          ),
                        ),
                        Form(
                          child: Column(
                            children: [
                              Obx(
                                () {
                                  return signInController.hasError
                                      ? Column(
                                          children: [
                                            SizedBox(height: 20),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                signInController.errMessage.string,
                                                style: TextStyle(
                                                  color: Colors.red[600],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container();
                                },
                              ),
                              SizedBox(height: 20),
                              AuthTextFieldEmail(emailController: signInController.emailController),
                              SizedBox(height: 20),
                              AuthTextFieldPassword(passwordController: signInController.passwordController),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 7, 5, 0),
                                  child: GestureDetector(
                                    onTap: () => Get.to(
                                      () => ResetPassword(),
                                    ),
                                    child: SizedBox(
                                      child: Text(
                                        "Forgot password?",
                                        style: TextStyle(
                                          fontSize: 12,
                                          decoration: TextDecoration.underline,
                                          color: themeService.textColor87,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Obx(
                                () {
                                  if (signInController.isLoading.isTrue) {
                                    return CircleLoading(size: 1.5);
                                  } else {
                                    return MyFillButton(
                                      text: "Login with email",
                                      color: Theme.of(context).primaryColor,
                                      onPressFunc: () => signInController.signInEmail(),
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: 15),
                              AuthSignInOptionDivider(),
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
                                onPressFunc: () => signInController.signInGoogle(),
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
