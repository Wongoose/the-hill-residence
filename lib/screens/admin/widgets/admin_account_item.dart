import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";
import "package:the_hill_residence/utilities/show_dialog.dart";

class AdminAccountItem extends StatelessWidget {
  final Account account;
  const AdminAccountItem({
    Key? key,
    required this.account,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => showManageAccDialog(account),
      child: Row(children: [
        Container(
          height: 40,
          width: 40,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          child: Opacity(
            opacity: 0.9,
            child: Image(
              image: AssetImage("assets/images/user.png"),
            ),
          ),
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
              account.unitAlias,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: themeService.textColor,
              ),
            ),
          ]),
        ),
        Expanded(child: Container()),
        Icon(Icons.edit, size: 18, color: themeService.textColor54),
      ]),
    );
  }
}
