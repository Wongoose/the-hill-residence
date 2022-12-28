import "package:flutter/material.dart";
import "package:fluttercontactpicker/fluttercontactpicker.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_visitor.dart";
import "package:the_hill_residence/utilities/navigation.dart";
import "package:the_hill_residence/utilities/show_dialog.dart";

class VRegController extends GetxController {
  // Controllers
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  // Keys
  final GlobalKey<FormState> contactKey = GlobalKey<FormState>();

  // Variables
  final DateTime today = DateTime.now();
  late DateTime selectDateLimit;
  late DateTime entryDate;
  late DateTime exitDate;

  bool firstValidate = true;

  @override
  void onReady() {
    super.onReady();
    entryDate = today;
    exitDate = today;
    selectDateLimit = today.add(Duration(days: 90));
  }

  // Getters
  String get visitorName => nameController.text.trim();
  String get visitorPhone => phoneController.text.trim();

  // Methods
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

  String reformatPhone(String phone) {
    if (phone.startsWith("0") && phone.length >= 10) phone = "6$phone";
    phone = phone.replaceAll("+", "").replaceAll("-", "").replaceAll(" ", "");
    return (phone);
  }

  void confirmVisitor() {
    showConfirmVisitorDialog(
        Visitor(name: visitorName, phone: reformatPhone(visitorPhone), entryDate: entryDate, exitDate: exitDate));
  }
}
