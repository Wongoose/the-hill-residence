import "package:flutter/material.dart";

class VRegTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;

  const VRegTextField({Key? key, required this.hintText, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color(0xff41aea9),
      keyboardType: TextInputType.text,
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
            fontSize: 15,
            color: Color(0xff213e3b).withOpacity(0.75),
          ),
          prefixIcon: Icon(
            icon,
            size: 16,
            color: Theme.of(context).primaryColor,
          ),
          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
