import "package:flutter/material.dart";
import "package:the_hill_residence/shared/my_text_input_decoration.dart";

class AuthTextFieldPassword extends StatelessWidget {
  const AuthTextFieldPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: passwordTextController,
      scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 80),
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: textInputDecoration.copyWith(
        hintText: "Password",
        hintStyle: TextStyle(
          color: Colors.black54,
        ),
        prefixIcon: Icon(
          Icons.lock_outline_rounded,
          color: Colors.black54,
        ),
        // suffixIcon: GestureDetector(
        //   onTap: () {
        //     setState(() =>
        //         visiblePassword = !visiblePassword);
        //   },
        //   child: Icon(
        //     visiblePassword
        //         ? FontAwesomeIcons.eye
        //         : FontAwesomeIcons.eyeSlash,
        //     size: 18,
        //     color: visiblePassword
        //         ? Colors.black
        //         : Colors.black54,
        //   ),
        // ),
        fillColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
