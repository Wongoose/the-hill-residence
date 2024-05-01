import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/controllers/user_details_controller.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";
import "package:the_hill_residence/models/model_user.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/shared/my_confirm_dialog.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";
import "package:the_hill_residence/shared/my_theme_divider.dart";

class FamilyAccViewDialog extends StatelessWidget {
  final Account account;
  const FamilyAccViewDialog({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
    final UserDetailsController userDetailsController = Get.put(UserDetailsController());
    final AppUser appUser = Get.put(AuthService()).appUser;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 60),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(children: [
            MyTextBolded(
              account.getRoleDisplay,
              color: account.isNew ? Colors.amber : Theme.of(context).primaryColor,
              fontSize: 24,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25),
            account.profileImageUrl != null
                ? ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: account.profileImageUrl!,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipOval(
                    child: Opacity(
                      opacity: 0.9,
                      child: Image(
                        image: AssetImage(
                          account.isNew ? "assets/images/pending.png" : "assets/images/user.png",
                        ),
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            SizedBox(height: 15),
            MyTextBolded(account.name ?? account.email, fontSize: 20, color: themeService.textColor70),
            SizedBox(height: 20),
            Row(children: [
              Icon(Icons.phone, size: 14, color: Theme.of(context).primaryColor),
              SizedBox(width: 7),
              MyText(account.getPhone, fontSize: 14, color: themeService.textColor70),
            ]),
            SizedBox(height: 7),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(Icons.home, size: 15, color: Theme.of(context).primaryColor),
              SizedBox(width: 7),
              Flexible(
                child: Text(
                  account.unitAlias,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: themeService.textColor70,
                  ),
                ),
              ),
            ]),
          ]),
        ),
        SizedBox(height: 30),
        // only owner can remove user
        if (!(account.isOwner ?? false) && appUser.isUnitOwner) ThemedDivider(height: 0),
        if (!(account.isOwner ?? false) && appUser.isUnitOwner)
          Container(
              margin: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Colors.transparent,
              child: TextButton(
                  onPressed: () => Get.dialog(MyConfirmDialog(
                        title: "Are you sure?",
                        body: "Remove ${account.name} from your unit. This person will need to be invited again.",
                        actionText: "Yes, remove member",
                        actionColor: Colors.red,
                        actionFunction: () async {
                          await userDetailsController.removeFamilyMember(account);
                          Get.back(closeOverlays: true);
                        },
                      )),
                  child: MyTextBolded("Remove member", color: Colors.red))),
        // ThemedDivider(height: 0),
        // ManageAccDialogActionButtons(),
      ]),
    );
  }
}
