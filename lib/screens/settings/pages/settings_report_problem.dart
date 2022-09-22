import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/settings/widgets/textfield_report_problem.dart";
import "package:the_hill_residence/shared/my_expanded_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";

class SettingsReportProblemPage extends StatelessWidget {
  SettingsReportProblemPage({Key? key}) : super(key: key);
  final MyThemeServiceController themeService = Get.find(tag: "themeService");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
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
                    TextFieldReportProblem(),
                  ],
                ),
              ),
              Expanded(child: Container()),
              MyExpandedButton(text: "Submit"),
            ],
          )),
    );
  }
}
