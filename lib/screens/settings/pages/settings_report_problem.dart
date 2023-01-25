import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/settings/widgets/textfield_report_problem.dart";
import "package:the_hill_residence/services/firebase/firestore.dart";
import "package:the_hill_residence/shared/my_confirm_dialog.dart";
import "package:the_hill_residence/shared/my_expanded_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";
import "package:the_hill_residence/shared/shared_classes.dart";

class SettingsReportProblemPage extends StatelessWidget {
  final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
  final TextEditingController textController = TextEditingController();
  SettingsReportProblemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DatabaseService db = Get.find();
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
                      MyPageAppBar(title: "Report a problem", appBarType: MyAppBarType.xmark),
                      // Expanded(child: Container()),
                      SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                        child: MyTextBolded(
                          "Please tell us more about the problem:",
                          color: themeService.textColor54,
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFieldReportProblem(textController: textController),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                MyExpandedButton(
                  text: "Submit",
                  onPressFunc: () async {
                    if (textController.text.isEmpty) return;
                    ReturnValue result = await db.submitReportProblem(textController.text.trim());
                    if (result.success) {
                      Get.dialog(
                        MyConfirmDialog(
                          title: "Report a problem",
                          body:
                              "Please describe the problem as detailed as you can. Are you sure to submit your report now?",
                          actionText: "Submit report",
                          actionFunction: () {
                            Get.back();
                            Get.back();
                            Get.showSnackbar(
                              GetSnackBar(
                                message:
                                    "Submitted. Thanks for pointing out the problem to us. We will use that information to further improve the app.",
                                duration: Duration(seconds: 3),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
