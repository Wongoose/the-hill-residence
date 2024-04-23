import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";
import "package:the_hill_residence/screens/create_account/widgets/invitation_unit_dialog.dart";

class InvitationUnitItem extends StatelessWidget {
  final Unit unit;
  const InvitationUnitItem({Key? key, required this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Get.dialog(InvitationUnitDialog(unit: unit)),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: Theme.of(context).primaryColor.withOpacity(0.1)),
                child: Opacity(opacity: 0.9, child: Image(image: AssetImage("assets/images/home.png")))),
            SizedBox(width: 20),
            Flexible(
              flex: 5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      unit.unitAlias,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: themeService.textColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      unit.residentsDisplay,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.ellipsis,
                        color: themeService.textColor,
                      ),
                    ),
                  ]),
            ),
            Expanded(child: Container()),
            Icon(Icons.check, size: 22, color: Theme.of(context).primaryColor),
          ]),
    );
  }
}
