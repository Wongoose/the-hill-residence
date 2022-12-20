import "package:flutter/material.dart";
import "package:fluttercontactpicker/fluttercontactpicker.dart";
import "package:the_hill_residence/shared/constants.dart";
import "package:the_hill_residence/utilities/navigation.dart";

class VRegController {
  // Controllers
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  // Keys
  final GlobalKey<FormState> contactKey = GlobalKey<FormState>();

  // Variables
  DateTime entryDate = DateTime.now();
  DateTime exitDate = DateTime.now();
  bool firstValidate = true;

  // Getters - Visitor dates display
  String get entryDateDisplay {
    final String day = entryDate.day.toString();
    final String month = myMonthArray[entryDate.month - 1];
    return ("$day $month");
  }

  String get exitDateDisplay {
    final String day = exitDate.day.toString();
    final String month = myMonthArray[exitDate.month - 1];
    return ("$day $month");
  }

  String get dialogDateDisplay {
    return ("$entryDateDisplay to $exitDateDisplay");
  }

  // Methods
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

  // Methods - Save visitor details
  void savePhoneAndName() {
    // NEXT: Validate success save details
    if (contactKey.currentState!.validate()) navigateToVRegDate();
    firstValidate = false;
  }
}
