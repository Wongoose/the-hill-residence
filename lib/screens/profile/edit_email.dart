import "package:flutter/material.dart";
import "package:the_hill_residence/shared/my_expanded_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/utilities/navigation.dart";
import "edit_profile_item_textbox.dart";

class EditEmailPage extends StatelessWidget {
  const EditEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyPageAppBar(
                    title: "Edit profile", appBarType: MyAppBarType.back),
                // Expanded(child: Container()),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: Text(
                    "Your email",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Nunito",
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: EditEmailTextbox(
                    hintText: "Enter new email",
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          MyExpandedButton(
            text: "Verify new email",
            onPressFunc: () => navigateToOpenInboxScreen(
                "We have sent a verification email to your inbox. Please follow the steps to complete this process."),
          ),
        ],
      )),
    );
  }
}
