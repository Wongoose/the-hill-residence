import "package:flutter/material.dart";
import "package:the_hill_residence/shared/my_text_input_decoration.dart";

class AuthTextFieldEmail extends StatelessWidget {
  const AuthTextFieldEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: emailTextController,
      scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 80),
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: textInputDecoration.copyWith(
        hintText: "Email",
        hintStyle: TextStyle(
          color: Colors.black54,
        ),
        prefixIcon: Icon(
          Icons.mail_outline_rounded,
          color: Colors.black54,
        ),
        fillColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      // validator: (val) => val.isEmpty
      //     ? "Email cannot be empty."
      //     : null,
    );
  }
}
