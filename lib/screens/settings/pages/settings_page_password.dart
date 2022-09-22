import "package:flutter/material.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";

class SettingsPasswordPage extends StatelessWidget {
  const SettingsPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyPageAppBar(title: "Password", appBarType: MyAppBarType.xmark),
                SizedBox(height: 40),
                // MyTextBolded("Manage account password"),
                // SizedBox(height: 20),
                MyText("The password for this account is secured."),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Change password?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
