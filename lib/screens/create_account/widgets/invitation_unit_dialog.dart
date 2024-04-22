import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";
import "package:the_hill_residence/shared/my_theme_divider.dart";

class InvitationUnitDialog extends StatelessWidget {
  final Unit unit;
  const InvitationUnitDialog({Key? key, required this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
    return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 60),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 30),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(children: [
                MyTextBolded("Unit details", fontSize: 24, textAlign: TextAlign.center),
                SizedBox(height: 25),
                // Image(height: 80, width: 80, image: AssetImage("assets/images/home.png")),
                Container(
                  height: 80,
                  width: 80,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                  ),
                  // circular profile picture inside
                  child: Opacity(
                    opacity: 0.9,
                    child: Image(
                      image: AssetImage("assets/images/home.png"),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(unit.uniqueIdentifier,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito",
                        color: themeService.textColor70)),
                // ThemedDivider(height: 40),
                SizedBox(height: 7),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 15, color: Theme.of(context).primaryColor),
                      SizedBox(width: 7),
                      Flexible(
                          child: Text(unit.ownerName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400, color: Theme.of(context).primaryColor))),
                    ]),
                SizedBox(height: 15),
                Text(
                  "You have been invited to be the owner. Accept invitation?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Nunito", color: themeService.textColor54, fontWeight: FontWeight.w400, fontSize: 14),
                ),
                SizedBox(height: 7),
              ])),
          SizedBox(height: 15),
          ThemedDivider(height: 0),
          Container(
              margin: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Theme.of(context).primaryColor,
              child: TextButton(onPressed: null, child: MyTextBolded("Accept invitation", color: Colors.white))),
        ]));
  }
}
