import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:image_stack/image_stack.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/models/model_user.dart";
import "package:the_hill_residence/screens/profile/pages/family_members.dart";
import "package:the_hill_residence/screens/profile/pages/invite_member.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/shared/my_confirm_dialog.dart";

class ProfileUserCard extends StatelessWidget {
  final List<String> listOfImages = [
    "assets/images/face.png",
    "assets/images/astronaut.jpg",
    "assets/images/zxprofile.png"
  ];

  ProfileUserCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
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
                      ImageStack(
                        imageSource: ImageSource.Asset,
                        totalCount: 3,
                        imageList: listOfImages,
                        imageRadius: 25, // Radius of each images
                        imageCount: 3, // Maximum number of images to be shown
                        imageBorderWidth: 1.5,
                        imageBorderColor: Colors.black87, // Border width around the images
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () async {
                          if (!appUser.hasUnitId) return;
                          Get.to(() => FamilyMembers());
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
                    appUser.unit?.myResidentsDisplay ?? "You",
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
