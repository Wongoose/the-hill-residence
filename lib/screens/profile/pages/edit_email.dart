import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/user_details_controller.dart";
import "package:the_hill_residence/screens/profile/widgets/edit_profile_item_textbox.dart";
import "package:the_hill_residence/shared/all_loading.dart";
import "package:the_hill_residence/shared/my_expanded_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";

class EditEmailPage extends StatelessWidget {
  const EditEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserDetailsController userDetailsController = Get.find();
    userDetailsController.emailController.text = userDetailsController.email ?? "";
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
                Form(
                  onChanged: () => userDetailsController.updateEditChanges(),
                  child: EditEmailTextbox(
                      hintText: "Enter new email", textController: userDetailsController.emailController),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Obx(() {
            userDetailsController.updateEditChanges();
            return userDetailsController.isLoading.isTrue
                ? CircleLoading(size: 1.5)
                : MyExpandedButton(
                    text: "Verify new email",
                    color: userDetailsController.emailHasChanges.value ? null : Colors.grey[400],
                    onPressFunc: () => userDetailsController.updateEmail());
          })
        ],
      )),
    );
  }
}
