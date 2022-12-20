import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/visitor_registration_controller.dart";

class VRegPhoneTextField extends StatelessWidget {
  final String hintText;
  final String? value;
  final IconData icon;
  final TextEditingController controller;

  const VRegPhoneTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Color(0xff41aea9),
      keyboardType: TextInputType.phone,
      enabled: true,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(fontFamily: "Nunito", fontSize: 16),
      scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 40),
      validator: (phone) {
        // NEXT: Proper phone validation
        if (phone == null || phone.isEmpty) return "Field cannot be empty.";
        if (phone.length < 10) return "Invalid phone number";
        return null;
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.circular(15),
          ),
          focusColor: Color(0xff41aea9),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff41aea9), width: 1.5), borderRadius: BorderRadius.circular(15)),
          hintStyle: TextStyle(fontSize: 15, color: Color(0xff213e3b).withOpacity(0.75)),
          prefixIcon: Icon(icon, size: 16, color: Theme.of(context).primaryColor),
          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
