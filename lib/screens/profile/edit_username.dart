import "package:flutter/material.dart";
import "package:the_hill_residence/screens/profile/edit_username_textbox.dart";
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
                    "Your username",
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
                  child: EditUsernameTextbox(
                    hintText: "Enter new username",
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Theme.of(context).primaryColor,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Nuinito",
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
