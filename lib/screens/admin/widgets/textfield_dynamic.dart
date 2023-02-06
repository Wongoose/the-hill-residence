import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/shared/my_text_input_decoration.dart";

class TextFieldDynamic extends StatelessWidget {
  final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
  final TextEditingController? textController;
  final String? title;
  final String? helperText;
  final bool? canEdit;

  TextFieldDynamic({
    this.textController,
    this.canEdit = true,
    this.title,
    this.helperText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      cursorColor: Theme.of(context).primaryColor,
      scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 80),
      style: TextStyle(color: themeService.textColor, fontSize: 16),
      decoration: textInputDecoration.copyWith(
        contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        hintText: title,
        hintStyle: TextStyle(color: themeService.textColor54),
        helperStyle: TextStyle(color: themeService.textColor54),
        helperMaxLines: 2,
        helperText: helperText,
        // prefixIcon: Icon(
        //   Icons.numbers_rounded,
        //   color: themeService.textColor54,
        // ),
        labelText: title,
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
        if (value == null || value.isEmpty) return "This field cannot be empty.";
        return (null);
      },
      enabled: canEdit,
    );
  }
}
