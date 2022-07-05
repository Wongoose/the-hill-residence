import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:get/get.dart';
import 'package:the_hill_residence/controllers/theme_service_controller.dart';
import "package:the_hill_residence/shared/my_text_widgets.dart";

// Activate, deactivate
// Owner
class ManageUnitDialog extends StatelessWidget {
  final MyThemeServiceController themeService = Get.find(tag: "themeService");
  ManageUnitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 60),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 30),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(children: [
                MyTextBolded("Manage unit", fontSize: 24, textAlign: TextAlign.center),
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
                Text("26, Jalan Sutera 2",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito",
                        color: themeService.textColor70)),
                // Divider(height: 40),
                SizedBox(height: 7),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 15, color: Theme.of(context).primaryColor),
                      SizedBox(width: 7),
                      Flexible(
                          child: Text("Robert",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400, color: Theme.of(context).primaryColor))),
                    ]),
                Divider(height: 20),
                Row(children: [
                  Icon(Icons.verified_user_rounded, size: 16, color: Theme.of(context).primaryColor),
                  SizedBox(width: 7),
                  Text("Enable access",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.7),
                          letterSpacing: 0.5)),
                  Expanded(child: Container()),
                  Checkbox(
                    onChanged: (bool? value) {},
                    value: true,
                    fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Theme.of(context).primaryColor;
                      } else {
                        return themeService.textColor54;
                      }
                    }),
                  ),
                ]),
              ])),
          SizedBox(height: 25),
          Divider(height: 0),
          IntrinsicHeight(
              child: Row(mainAxisSize: MainAxisSize.max, children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.transparent,
                    child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Icon(Icons.phone, color: Theme.of(context).accentColor)))),
            VerticalDivider(thickness: 0, width: 0),
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.transparent,
                    child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Icon(Icons.home, color: Theme.of(context).accentColor)))),
            VerticalDivider(thickness: 0, width: 0),
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.transparent,
                    child: TextButton(
                        onPressed: () => Navigator.pop(context), child: Icon(Icons.delete, color: Colors.red)))),
          ])),
        ]));
  }
}
