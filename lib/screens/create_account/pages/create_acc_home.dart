import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:the_hill_residence/controllers/theme_service_controller.dart';
import 'package:the_hill_residence/screens/auth/widgets/auth_richtext.dart';
import 'package:the_hill_residence/screens/auth/widgets/auth_textfield_email.dart';
import 'package:the_hill_residence/screens/auth/widgets/auth_textfield_password.dart';
import 'package:the_hill_residence/screens/create_account/widgets/textfield_first_name.dart';
import 'package:the_hill_residence/screens/create_account/widgets/textfield_last_name.dart';
import "package:the_hill_residence/shared/my_page_appbar.dart";

class CreateAccHome extends StatelessWidget {
  final MyThemeServiceController themeService =
      Get.find<MyThemeServiceController>();
  CreateAccHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
        child: Column(
          children: [
            MyPageAppBar(
                title: "Create account", appBarType: MyAppBarType.back),
            Expanded(child: Container()),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: AuthRichText(
                coloredText: "Get started!",
                text: "",
              ),
            ),
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
              ),
            ),
            SizedBox(height: 20),
            AuthTextFieldEmail(canEdit: false),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(flex: 1, child: TextFieldFirstName()),
                SizedBox(width: 15),
                Expanded(flex: 1, child: TextFieldLastName()),
              ],
            ),
            SizedBox(height: 20),
            AuthTextFieldPassword(showPrefixIcon: false),
          ],
        ),
      )),
    );
  }
}
