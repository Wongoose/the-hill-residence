import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/user_details_controller.dart";
import "package:the_hill_residence/screens/create_account/widgets/textfield_fullname.dart";
import "package:the_hill_residence/shared/my_expanded_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";

class EditUsernamePage extends StatelessWidget {
  const EditUsernamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserDetailsController userDetailsController = Get.find();
    userDetailsController.fullNameController.text = userDetailsController.fullName ?? "";
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyPageAppBar(title: "Edit profile", appBarType: MyAppBarType.back),
                // Expanded(child: Container()),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: Text(
                    "Your name",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Nunito",
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Form(
                    key: userDetailsController.fullNameKey,
                    child: TextFieldFullName(textController: userDetailsController.fullNameController)),
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
          MyExpandedButton(text: "Save changes", onPressFunc: userDetailsController.updateFullName),
        ],
      )),
    );
  }
}
