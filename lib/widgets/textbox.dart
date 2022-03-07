import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class VRegTextField extends StatelessWidget {
  final String hintText;

  const VRegTextField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color(0xff41aea9),
      keyboardType: TextInputType.phone,
      enabled: true,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(fontFamily: "Nunito", fontSize: 16),
      // selectionHeightStyle: BoxHeightStyle.tight,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff41aea9)),
              borderRadius: BorderRadius.circular(15)),
          focusColor: Color(0xff41aea9),
          hintStyle: TextStyle(
            color: Color(0xff213e3b).withOpacity(0.75),
          ),
          prefixIcon: Icon(
            FontAwesomeIcons.phoneAlt,
            size: 16,
            color: Theme.of(context).primaryColor,
          ),
          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          isDense: false,
          fillColor: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
