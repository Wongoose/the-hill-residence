import "dart:async";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/admin_controller.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/shared/all_loading.dart";
import "package:the_hill_residence/shared/my_text_input_decoration.dart";

class TextFieldUniqueIdentifier extends StatelessWidget {
  final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
  final AdminController adminController = Get.put(AdminController());
  final TextEditingController? textController;
  final bool? canEdit;

  TextFieldUniqueIdentifier({
    this.textController,
    this.canEdit = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer timer = Timer(Duration(seconds: 2), () {});
    return Obx(() {
      return TextFormField(
        controller: textController,
        cursorColor: Theme.of(context).primaryColor,
        scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 80),
        style: TextStyle(color: themeService.textColor, fontSize: 16),
        onChanged: ((value) {
          timer.cancel();
          adminController.checkerLoading(true);
          if (value.isEmpty) return;
          timer = Timer(Duration(seconds: 2), () async {
            await adminController.checkUniqueIdentifier(value.trim());
            adminController.checkerLoading(false);
          });
        }),
        decoration: textInputDecoration.copyWith(
          errorText: adminController.isUnique.value ? null : "This unique identifier has already been used",
          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          hintText: "Unique identifier",
          hintStyle: TextStyle(color: themeService.textColor54),
          helperStyle: TextStyle(color: themeService.textColor54),
          helperMaxLines: 2,
          helperText: "Note: Must not have the same name as any other units",
          labelText: "Unique identifier",
          labelStyle: TextStyle(color: themeService.textColor54),
          suffixIcon: adminController.checkerLoading.value
              ? CircleLoading()
              : adminController.isUnique.value
                  ? Icon(Icons.check_circle_outline_rounded, color: Theme.of(context).primaryColor)
                  : Icon(Icons.cancel_outlined, color: Colors.red),
          floatingLabelStyle: TextStyle(
            color: adminController.isUnique.value ? Theme.of(context).primaryColor : Colors.red,
            fontSize: 18,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: themeService.textColor26,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: themeService.textColor26,
              width: 1,
            ),
          ),
          fillColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return "This field cannot be empty.";
          return (null);
        },
        enabled: canEdit,
      );
    });
  }
}
