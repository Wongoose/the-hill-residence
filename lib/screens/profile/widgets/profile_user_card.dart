import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/controllers/user_details_controller.dart";
import "package:the_hill_residence/models/model_user.dart";
import "package:the_hill_residence/screens/create_account/pages/create_acc_check_invitation.dart";
import "package:the_hill_residence/screens/create_account/pages/no_invitation_page.dart";
import "package:the_hill_residence/screens/profile/pages/family_members.dart";
import "package:the_hill_residence/screens/profile/pages/invite_member.dart";
import "package:the_hill_residence/screens/profile/widgets/profile_img_stack.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/shared/my_confirm_dialog.dart";

class ProfileUserCard extends StatelessWidget {
  const ProfileUserCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
    final UserDetailsController userDetailsController = Get.put(UserDetailsController());
    final AppUser appUser = Get.put(AuthService()).appUser;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Card(
            margin: EdgeInsets.fromLTRB(2, 2, appUser.isUnitOwner ? 20 : 2, 2),
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const ProfileImgStack(),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () async {
                          if (!appUser.hasUnitId) {
                            await userDetailsController.getUnits(); // will update units obs
                            await userDetailsController.getInvitedUnits();
                            Get.to(() => userDetailsController.units.isEmpty
                                ? NoInvitationPage(
                                    email: userDetailsController.email, fullName: userDetailsController.fullName)
                                : CreateAccInvitation(units: userDetailsController.units));
                          } else {
                            Get.to(() => FamilyMembers());
                          }
                        },
                        child: Icon(
                          Icons.more_horiz,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    appUser.getUnitAlias,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2.5),
                  Text(
                    appUser.myResidentsDisplay,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appUser.isUnitOwner
            ? Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => Get.dialog(MyConfirmDialog(
                      title: "Add member",
                      body: "Do you want to invite a new family member to ${appUser.getUnitAlias}?",
                      actionText: "Continue",
                      actionFunction: () => Get.to(() => InviteMember()))),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: themeService.textColor12,
                    ),
                    child: Icon(
                      CupertinoIcons.add,
                      color: themeService.textColor54,
                      size: 20,
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
