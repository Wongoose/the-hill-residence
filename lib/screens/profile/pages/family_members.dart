import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/controllers/user_details_controller.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";
import "package:the_hill_residence/models/model_user.dart";
import "package:the_hill_residence/screens/admin/widgets/admin_account_item.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_richtext.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_theme_divider.dart";

class FamilyMembers extends StatelessWidget {
  // final List<Account> accounts;
  // const FamilyMembers({required this.accounts});

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.find();
    final UserDetailsController userDetailsController = Get.find();
    final AppUser appUser = Get.put(AuthService()).appUser;

    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            MyPageAppBar(title: "My unit", appBarType: MyAppBarType.back),
            SizedBox(height: 40),
            Align(
                alignment: Alignment.centerLeft,
                child: AuthRichText(
                  coloredText: "Family members",
                  text: "",
                )),
            SizedBox(height: 20),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                child: Text(
                  "Family members under ${appUser.getUnitAlias}",
                  style: TextStyle(
                      fontFamily: "Nunito", color: themeService.textColor54, fontWeight: FontWeight.w400, fontSize: 14),
                )),
            SizedBox(height: 25),
            Expanded(
              child: FutureBuilder(
                  future: userDetailsController.getUnitResidents(appUser.unit!),
                  builder: (context, snapshot) {
                    final List<Account> accounts = snapshot.data ?? [];
                    return ListView.separated(
                        itemCount: accounts.length,
                        itemBuilder: (context, i) => AdminAccountItem(account: accounts[i]),
                        separatorBuilder: (context, i) => ThemedDivider(height: 60));
                  }),
            ),
            Expanded(child: Container()),
          ])),
    ));
  }
}
