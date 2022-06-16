import "package:flutter/material.dart";
import 'package:the_hill_residence/screens/create_account/widgets/textfield_first_name.dart';
import 'package:the_hill_residence/screens/create_account/widgets/textfield_last_name.dart';
import "package:the_hill_residence/screens/profile/edit_username_textbox.dart";
import 'package:the_hill_residence/shared/my_expanded_btn.dart';
import "package:the_hill_residence/shared/my_page_appbar.dart";

class EditUsernamePage extends StatelessWidget {
  const EditUsernamePage({Key? key}) : super(key: key);

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
                    "Account name",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Nunito",
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(children: [
                  Expanded(flex: 1, child: TextFieldFirstName()),
                  SizedBox(width: 15),
                  Expanded(flex: 1, child: TextFieldLastName()),
                ]),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                //   child: EditUsernameTextbox(
                //     hintText: "Enter new username",
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(child: Container()),
          MyExpandedButton(text: "Save changes"),
        ],
      )),
    );
  }
}
