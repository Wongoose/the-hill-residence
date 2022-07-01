import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:get/get.dart';
import 'package:the_hill_residence/controllers/theme_service_controller.dart';
import "package:the_hill_residence/shared/my_text_widgets.dart";

class ManageAccDialog extends StatelessWidget {
  final MyThemeServiceController themeService = Get.find(tag: "themeService");
  ManageAccDialog({Key? key}) : super(key: key);

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
                MyTextBolded("Manage account", fontSize: 24, textAlign: TextAlign.center),
                SizedBox(height: 25),
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(height: 80, width: 80, image: AssetImage("assets/images/face.png"))),
                SizedBox(height: 15),
                Text("John Doe",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito",
                        color: Colors.black.withOpacity(0.7))),
                // Divider(height: 40),
                SizedBox(height: 20),
                Row(children: [
                  Icon(Icons.phone, size: 14, color: Theme.of(context).primaryColor),
                  SizedBox(width: 7),
                  Text("+6016-331 5288",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.7),
                          letterSpacing: 0.5)),
                ]),
                SizedBox(height: 7),
                Row(children: [
                  Icon(FontAwesomeIcons.home, size: 14, color: Theme.of(context).primaryColor),
                  SizedBox(width: 7),
                  Text("Lot 123, Jalan Raya Terubong",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.7),
                          letterSpacing: 0.5)),
                ]),
              ])),
          SizedBox(height: 25),
          Divider(height: 0),
          Row(mainAxisSize: MainAxisSize.max, children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.transparent,
                    child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Icon(Icons.phone, color: Theme.of(context).accentColor)))),
            VerticalDivider(
              color: themeService.textColor26,
              thickness: 0.5,
              width: 1,
            ),
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.transparent,
                    child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Icon(Icons.home, color: Theme.of(context).accentColor)))),
            VerticalDivider(
              color: Colors.black,
              thickness: 0.5,
              width: 1,
            ),
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.transparent,
                    child: TextButton(
                        onPressed: () => Navigator.pop(context), child: Icon(Icons.delete, color: Colors.red)))),
          ]),
        ]));
  }
}
