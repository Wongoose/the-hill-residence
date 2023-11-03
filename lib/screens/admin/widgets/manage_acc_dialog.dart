import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";

class ManageAccDialog extends StatelessWidget {
  final Account account;
  const ManageAccDialog({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
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
            Image(height: 80, width: 80, image: AssetImage("assets/images/face.png")),
            SizedBox(height: 15),
            MyTextBolded(account.name, fontSize: 20, color: themeService.textColor70),
            SizedBox(height: 20),
            Row(children: [
              Icon(Icons.phone, size: 14, color: Theme.of(context).primaryColor),
              SizedBox(width: 7),
              MyText(account.phone.isEmpty ? "No phone registered" : account.phone,
                  fontSize: 14, color: themeService.textColor70),
            ]),
            SizedBox(height: 7),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(Icons.home, size: 15, color: Theme.of(context).primaryColor),
              SizedBox(width: 7),
              Flexible(
                child: Text(
                  account.address,
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
        SizedBox(height: 20),
        Container(
            margin: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Colors.transparent,
            child: TextButton(onPressed: null, child: MyText("View unit", color: themeService.textColor54))),
        Divider(height: 0),
        Container(
            margin: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Colors.transparent,
            child: TextButton(onPressed: null, child: MyTextBolded("Delete account", color: Colors.red))),
        // Divider(height: 0),
        // ManageAccDialogActionButtons(),
      ]),
    );
  }
}
