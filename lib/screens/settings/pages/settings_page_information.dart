import "package:flutter/material.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_settings_item.dart";

class SettingsInformationPage extends StatelessWidget {
  const SettingsInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyPageAppBar(
                title: "T&C, Policies", appBarType: MyAppBarType.xmark),
            SizedBox(height: 40),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            //   child: Text(
            //     "MORE INFO",
            //     style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w500,
            //       color: Colors.black45,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 20),
            MySettingsItem(itemIcon: Icons.book, text: "Terms & Conditions"),
            SizedBox(height: 15),
            MySettingsItem(
                itemIcon: Icons.privacy_tip_rounded, text: "Privacy Policy"),
            SizedBox(height: 15),
            MySettingsItem(
                itemIcon: Icons.people_rounded, text: "Community Guidelines"),
          ],
        ),
      )),
    );
  }
}
