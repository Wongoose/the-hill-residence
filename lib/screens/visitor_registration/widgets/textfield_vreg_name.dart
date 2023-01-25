import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:the_hill_residence/controllers/theme_service_controller.dart';

class VRegNameTextField extends StatelessWidget {
  final String hintText;
  final String? value;
  final IconData icon;
  final TextEditingController controller;

  const VRegNameTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return TextFormField(
      controller: controller,
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: TextInputType.text,
      enabled: true,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(fontFamily: "Nunito", fontSize: 16),
      scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 40),
      validator: (name) {
        // NEXT: Proper name validation
        if (name == null || name.isEmpty) return "Field cannot be empty.";
        if (name.length < 3) return "Short name is unidentifiable";
        return null;
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themeService.textColor26),
            borderRadius: BorderRadius.circular(15),
          ),
          focusColor: Theme.of(context).primaryColor,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(15)),
          hintStyle: TextStyle(fontSize: 15, color: themeService.textColor54),
          prefixIcon: Icon(icon, size: 16, color: Theme.of(context).primaryColor),
          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
