import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";
import "package:the_hill_residence/screens/profile/widgets/family_acc_view_dialog.dart";

class FamilyAccountItem extends StatelessWidget {
  final Account account;
  const FamilyAccountItem({
    Key? key,
    required this.account,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Get.dialog(FamilyAccViewDialog(account: account)),
      child: Row(children: [
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: account.isNew ? Colors.amber.withOpacity(0.1) : Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: account.profileImageUrl == null
                  ? Opacity(
                      opacity: 0.9,
                      child: Image(
                        image: AssetImage(
                          account.isNew ? "assets/images/pending.png" : "assets/images/user.png",
                        ),
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: account.profileImageUrl!,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    )),
        ),
        SizedBox(width: 20),
        Flexible(
          flex: 5,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              account.name ?? account.email,
              maxLines: 1,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color: themeService.textColor,
              ),
            ),
            SizedBox(height: 4),
            Text(
              account.getRoleDisplay,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: themeService.textColor,
              ),
            ),
          ]),
        ),
        Expanded(child: Container()),
      ]),
    );
  }
}
