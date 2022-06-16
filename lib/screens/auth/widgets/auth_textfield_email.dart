import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/shared/my_text_input_decoration.dart";

class AuthTextFieldEmail extends StatelessWidget {
  final MyThemeServiceController themeService =
      Get.put(MyThemeServiceController());
  final TextEditingController? emailController;
  final bool? canEdit;
  final String? initialText;

  AuthTextFieldEmail({
    this.emailController,
    this.initialText,
    this.canEdit = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 80),
      style: TextStyle(color: themeService.textColor, fontSize: 16),
      initialValue: initialText,
      decoration: textInputDecoration.copyWith(
        hintText: "Email",
        hintStyle: TextStyle(
          color: themeService.textColor54,
        ),
        prefixIcon: Icon(
          Icons.mail_outline_rounded,
          color: themeService.textColor54,
        ),
        labelText: "Email",
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
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
      enabled: canEdit,
      // validator: (val) => val.isEmpty
      //     ? "Email cannot be empty."
      //     : null,
    );
  }
}
