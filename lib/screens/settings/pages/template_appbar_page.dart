import "package:flutter/material.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";

class SettingsPasswordPage extends StatelessWidget {
  const SettingsPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
        child: Column(
          children: [
            MyPageAppBar(title: "Password", appBarType: MyAppBarType.xmark),
            SizedBox(height: 40),
          ],
        ),
      )),
    );
  }
}
