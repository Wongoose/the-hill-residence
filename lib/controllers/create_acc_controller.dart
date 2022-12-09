import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/services/firebase/firestore.dart";
import 'package:the_hill_residence/shared/shared_classes.dart';

class CreateAccController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController unitNumController = TextEditingController();

  final GlobalKey<FormState> firstLastNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addressKey = GlobalKey<FormState>();
  final DatabaseService _db = Get.find();

  RxBool isLoading = false.obs;

  // Getters
  String get firstName => (firstNameController.text.trim());
  String get address => (addressController.text.trim());
  String get unitNum => (unitNumController.text.trim());
  String get lastName => (lastNameController.text.trim());
  bool get validateFirstAndLastName => (firstLastNameKey.currentState!.validate());
  bool get validateAddress => (addressKey.currentState!.validate());

  void submitCreateAccDetails() async {
    isLoading(true);
    ReturnValue result = await _db.updateUser({
      "firstName": firstName,
      "lastName": lastName,
      "address": address,
      "unitNum": unitNum,
    });
    isLoading(false);
    if (!result.success) {
      Get.showSnackbar(GetSnackBar(message: "Failed to create account! Please check your connection and try again."));
    }
  }
}
