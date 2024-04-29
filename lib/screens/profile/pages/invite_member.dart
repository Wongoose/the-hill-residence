import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/controllers/user_details_controller.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_textfield_email.dart";
import "package:the_hill_residence/screens/profile/pages/family_members.dart";
import "package:the_hill_residence/shared/all_loading.dart";
import "package:the_hill_residence/shared/my_expanded_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";

class InviteMember extends StatelessWidget {
  final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
  final TextEditingController textController = TextEditingController();
  final UserDetailsController userDetailsController = Get.put(UserDetailsController());
  InviteMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(shrinkWrap: true, slivers: [
          SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyPageAppBar(title: "Add family member", appBarType: MyAppBarType.xmark),
                      // Expanded(child: Container()),
                      SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                        child: MyTextBolded(
                          "Invite with email",
                          color: themeService.textColor54,
                        ),
                      ),
                      SizedBox(height: 15),
                      AuthTextFieldEmail(emailController: textController),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Obx(() {
                  return userDetailsController.isLoading.isTrue
                      ? CircleLoading(size: 1.5)
                      : MyExpandedButton(
                          text: "Send invitation",
                          onPressFunc: () async {
                            // NEXT: Validate email address
                            if (textController.text.isEmpty) return;
                            await userDetailsController.inviteNewMember(textController.text.trim());
                            Get.off(() => FamilyMembers());
                          },
                        );
                }),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
