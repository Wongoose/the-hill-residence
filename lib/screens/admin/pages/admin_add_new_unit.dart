import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/admin_controller.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/admin/widgets/textfield_dynamic.dart";
import "package:the_hill_residence/screens/admin/widgets/textfield_unique_identifier.dart";
import "package:the_hill_residence/shared/all_loading.dart";
import "package:the_hill_residence/shared/my_expanded_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";

class AddNewUnitPage extends StatefulWidget {
  const AddNewUnitPage({Key? key}) : super(key: key);

  @override
  State<AddNewUnitPage> createState() => _AddNewUnitPageState();
}

class _AddNewUnitPageState extends State<AddNewUnitPage> {
  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
    final AdminController adminController = Get.put(AdminController());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(22, 32, 22, 32),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              MyPageAppBar(title: "Add new unit", appBarType: MyAppBarType.back),
              // Expanded(child: Container()),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                child: Text(
                  "New unit details",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                    color: themeService.textColor54,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  TextFieldUniqueIdentifier(textController: adminController.uniqueIdentifierController),
                  SizedBox(height: 30),
                  TextFieldDynamic(
                    title: "Owner's email",
                    helperText: "Note: The owner's account will be registered under this unit",
                    textController: adminController.ownerEmailController,
                  ),
                  SizedBox(height: 20),
                ]),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                child: Row(children: [
                  Icon(Icons.verified_user_rounded, size: 17, color: Theme.of(context).primaryColor),
                  SizedBox(width: 7),
                  MyText("Activate unit now", color: themeService.textColor87),
                  Expanded(child: Container()),
                  Checkbox(
                    onChanged: (bool? value) => setState(() => adminController.activation = value!),
                    value: adminController.activation,
                    fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Theme.of(context).primaryColor;
                      } else {
                        return themeService.textColor54;
                      }
                    }),
                    visualDensity: VisualDensity.comfortable,
                  ),
                ]),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  "You can always activate/deactivate this unit later.",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: themeService.textColor45,
                  ),
                ),
              ),
            ]),
          ),
          Expanded(child: Container()),
          Obx(() {
            return adminController.loading.value
                ? CircleLoading(size: 1.5)
                : MyExpandedButton(
                    text: "Create new unit",
                    color: adminController.newUnitInputComplete ? Theme.of(context).primaryColor : Colors.grey,
                    onPressFunc: () {
                      if (formKey.currentState!.validate() && adminController.newUnitInputComplete) {
                        adminController.createNewUnit();
                        // NEXT: Show success dialog and instructions to contact owner (via email / phone)
                        // NEXT: Owner on app initialize check for units under his email
                      }
                    });
          }),
        ]),
      ),
    );
  }
}
