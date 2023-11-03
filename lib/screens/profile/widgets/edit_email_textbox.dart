import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";

class EditEmailTextbox extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final TextEditingController? textController;

  const EditEmailTextbox({Key? key, required this.hintText, this.icon, this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return TextFormField(
      controller: textController,
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: TextInputType.text,
      enabled: true,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(fontFamily: "Nunito", fontSize: 16),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themeService.textColor26), borderRadius: BorderRadius.circular(15)),
        focusColor: Theme.of(context).primaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        hintStyle: TextStyle(
          fontSize: 15,
          color: Color(0xff213e3b).withOpacity(0.75),
        ),
        // ignore: unnecessary_null_comparison
        prefixIcon: icon == null
            ? null
            : Icon(
                icon,
                size: 16,
                color: Theme.of(context).primaryColor,
              ),
        suffixIcon: Icon(
          Icons.edit,
          size: 16,
          color: Theme.of(context).primaryColor,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
