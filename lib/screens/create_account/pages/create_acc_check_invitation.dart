import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/user_details_controller.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_richtext.dart";
import "package:the_hill_residence/screens/create_account/widgets/invitation_unit_item.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_center_display.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_theme_divider.dart";

class CreateAccInvitation extends StatelessWidget {
  const CreateAccInvitation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.find();
    final UserDetailsController userDetailsController = Get.find();
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            MyPageAppBar(title: "Create account", appBarType: MyAppBarType.back),
            SizedBox(height: 40),
            Align(
                alignment: Alignment.centerLeft,
                child: AuthRichText(
                  coloredText: "Invitations",
                  text: "",
                )),
            SizedBox(height: 20),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                child: Text(
                  "Please select the unit that belongs to you",
                  style: TextStyle(
                      fontFamily: "Nunito", color: themeService.textColor54, fontWeight: FontWeight.w400, fontSize: 14),
                )),
            SizedBox(height: 25),
            Expanded(
              child: FutureBuilder(
                  future: userDetailsController.getUnits(),
                  builder: (context, _) {
                    final List<Unit> data = userDetailsController.units;
                    if (data.isEmpty) {
                      return VRegCenterImageText(
                        imagePath: "assets/images/reminder.png",
                        title: "No invitation",
                        description: "If you think there's a mistake, please contact your administrator.",
                      );
                    }
                    return Obx(() {
                      return ListView.separated(
                          itemCount: data.length,
                          itemBuilder: (context, i) => InvitationUnitItem(unit: data[i]),
                          separatorBuilder: (context, i) => ThemedDivider(height: 60));
                    });
                  }),
            ),
            Expanded(child: Container()),
          ])),
    ));
  }
}
