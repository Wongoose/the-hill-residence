import "package:flutter/material.dart";
import "package:fluttercontactpicker/fluttercontactpicker.dart";
import "package:get/get.dart";

class VRegController extends GetxController {
  //currently GetXController class is not needed
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  RxString visitorPhone = "".obs;
  RxString visitorName = "".obs;

  Rx<DateTime> entryDate = DateTime.now().obs;
  Rx<DateTime> exitDate = DateTime.now().obs;

  void selectNewContact() async {
    final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();
    // handlle error when "back pressed"

    phoneController.text = contact.phoneNumber?.number ?? "";
    nameController.text = contact.fullName ?? "";
  }
}
