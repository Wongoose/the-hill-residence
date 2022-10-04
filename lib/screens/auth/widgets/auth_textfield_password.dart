import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/shared/my_text_input_decoration.dart";

class AuthTextFieldPassword extends StatefulWidget {
  final TextEditingController? passwordController;
  final bool showPrefixIcon;

  const AuthTextFieldPassword({
    this.passwordController,
    this.showPrefixIcon = true,
    Key? key,
  }) : super(key: key);

  @override
  State<AuthTextFieldPassword> createState() => _AuthTextFieldPasswordState();
}

class _AuthTextFieldPasswordState extends State<AuthTextFieldPassword> {
  final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 80),
      style: TextStyle(
        color: themeService.textColor,
      ),
      obscureText: !visiblePassword,
      decoration: textInputDecoration.copyWith(
        contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        hintText: "Password",
        hintStyle: TextStyle(
          color: themeService.textColor54,
        ),
        labelText: "Password",
        floatingLabelStyle: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
        prefixIcon: widget.showPrefixIcon
            ? Icon(
                Icons.lock_outline_rounded,
                color: themeService.textColor54,
              )
            : null,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() => visiblePassword = !visiblePassword);
          },
          child: Icon(
            visiblePassword ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
            size: 18,
            color: visiblePassword ? Theme.of(context).primaryColor : Colors.black54,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: themeService.textColor26,
            width: 1,
          ),
        ),
        fillColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
