import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/admin_controller.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";
import "package:the_hill_residence/shared/my_confirm_dialog.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";
import "package:the_hill_residence/shared/my_theme_divider.dart";

// Activate, deactivate
// Owner
class ManageUnitDialog extends StatelessWidget {
  final Unit unit;
  const ManageUnitDialog({Key? key, required this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
    final AdminController adminController = Get.put(AdminController());
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                ActivateUnitCheckBox(unit: unit),
              ])),
          SizedBox(height: 15),
          ThemedDivider(height: 0),
          Container(
              margin: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Colors.transparent,
              child: TextButton(
                  onPressed: () async {
                    await Get.dialog(MyConfirmDialog(
                        title: "Are you sure?",
                        body: "Permanently delete this unit.",
                        actionText: "Yes, delete unit",
                        actionColor: Colors.red,
                        actionFunction: () async {
                          await adminController.deleteUnit(unit);
                        },
                      ));
                  },
                  child: MyTextBolded("Delete unit", color: Colors.red))),
        ]));
  }
}

class ActivateUnitCheckBox extends StatefulWidget {
  const ActivateUnitCheckBox({
    super.key,
    required this.unit,
  });

  final Unit unit;

  @override
  State<ActivateUnitCheckBox> createState() => _ActivateUnitCheckBoxState();
}

class _ActivateUnitCheckBoxState extends State<ActivateUnitCheckBox> {
  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
    final AdminController adminController = Get.put(AdminController());
    return Row(children: [
      Icon(Icons.verified_user_rounded, size: 17, color: Theme.of(context).primaryColor),
      SizedBox(width: 7),
      MyText("Activate unit", color: themeService.textColor87),
      Expanded(child: Container()),
      Checkbox(
          onChanged: (bool? value) async {
            setState(() => widget.unit.activated = value!);
            await adminController.updateUnitActivation(widget.unit);
          },
          value: widget.unit.activated,
          fillColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).primaryColor;
            } else {
              return themeService.textColor54;
            }
          }),
          visualDensity: VisualDensity.comfortable),
    ]);
  }
}
