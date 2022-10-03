import "package:flutter/material.dart";
import "package:fluttercontactpicker/fluttercontactpicker.dart";

class VRegController {
  //currently GetXController class is not needed
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final List<String> monthArray = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

  DateTime entryDate = DateTime.now();
  DateTime exitDate = DateTime.now();

  String get entryDateDisplay {
    final String day = entryDate.day.toString();
    final String month = monthArray[entryDate.month - 1];
    return ("$day $month");
  }

  String get exitDateDisplay {
    final String day = exitDate.day.toString();
    final String month = monthArray[exitDate.month - 1];
    return ("$day $month");
  }

  String get dialogDateDisplay {
    return ("$entryDateDisplay to $exitDateDisplay");
  }

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
