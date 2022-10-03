import 'dart:io';

import "package:flutter/material.dart";
import "package:fluttercontactpicker/fluttercontactpicker.dart";

class VRegController {
  //currently GetXController class is not needed
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String visitorPhone = "";
  String visitorName = "";

  DateTime entryDate = DateTime.now();
  DateTime exitDate = DateTime.now();

  void updateEntryDate(DateTime selection) {
    entryDate = selection;
    updateExitDate(selection);
  }

  void updateExitDate(DateTime selection) => exitDate = selection;

  void selectNewContact() async {
    try {
      final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();
      phoneController.text = contact.phoneNumber?.number ?? "";
      nameController.text = contact.fullName ?? "";
    } catch (_) {}
  }
}
