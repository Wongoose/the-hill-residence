import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/sign_in_controller.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_richtext.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_textfield_email.dart";
import "package:the_hill_residence/screens/create_account/widgets/textfield_first_name.dart";
import "package:the_hill_residence/screens/create_account/widgets/textfield_last_name.dart";
import "package:the_hill_residence/shared/my_expanded_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/utilities/navigation.dart";

class CreateAccHome extends StatelessWidget {
  final String accountEmail;
  const CreateAccHome({Key? key, required this.accountEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.find();
    final SignInController signInController = Get.put(SignInController());
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
                  child: Column(children: [
                    MyPageAppBar(title: "Create account", appBarType: MyAppBarType.back),
                    // Expanded(child: Container()),
                    SizedBox(height: 40),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: AuthRichText(
                          coloredText: "Get started!",
                          text: "",
                        )),
                    SizedBox(height: 20),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Text(
                          "First, create your The-Hill Residence account.",
                          style: TextStyle(
                              fontFamily: "Nunito",
                              color: themeService.textColor54,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Obx(() {
                        return signInController.hasError
                            ? Column(children: [
                                SizedBox(height: 20),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(signInController.errMessage.string,
                                        style: TextStyle(
                                          color: Colors.red[600],
                                          fontFamily: "Nunito",
                                          fontSize: 14,
                                        ))),
                              ])
                            : Container();
                      }),
                    ),
                    SizedBox(height: 20),
                    AuthTextFieldEmail(initialText: accountEmail, canEdit: false),
                    SizedBox(height: 20),
                    Row(children: [
                      Expanded(
                          flex: 1, child: TextFieldFirstName(textController: signInController.firstNameController)),
                      SizedBox(width: 15),
                      Expanded(flex: 1, child: TextFieldLastName(textController: signInController.lastNameController)),
                    ]),
                  ])),
              Expanded(child: Container()),
              MyExpandedButton(
                text: "Save and continue",
                // NEXT: validate first name, last name
                onPressFunc: () => navigateToCreateAccAddress(),
              ),
            ]),
          ),
        ],
      )),
    );
  }
}
