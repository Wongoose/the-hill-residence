import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/shared/my_text_input_decoration.dart";

class TextFieldState extends StatelessWidget {
  final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
  final TextEditingController? textController;
  final String? initialText;

  TextFieldState({
    this.textController,
    this.initialText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textController,
        cursorColor: Theme.of(context).primaryColor,
        scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 80),
        style: TextStyle(color: themeService.textColor, fontSize: 16),
        initialValue: initialText,
        decoration: textInputDecoration.copyWith(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          hintText: "State",
          hintStyle: TextStyle(
            color: themeService.textColor54,
          ),
          labelText: "State",
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
        validator: (value) {
          if (value == null || value.isEmpty) return ("Field cannot be empty.");
          return null;
        });
  }
}
