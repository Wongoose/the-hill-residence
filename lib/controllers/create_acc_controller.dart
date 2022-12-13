import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/services/firebase/firestore.dart";
import "package:the_hill_residence/shared/shared_classes.dart";

class CreateAccController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController unitNumController = TextEditingController();

  final GlobalKey<FormState> fullNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addressKey = GlobalKey<FormState>();
  final DatabaseService _db = Get.find();

  RxBool isLoading = false.obs;

  // Getters
  String get fullName => (fullNameController.text.trim());
  String get address => (addressController.text.trim());
  String get unitNum => (unitNumController.text.trim());
  bool get validateFullName => (fullNameKey.currentState!.validate());
  bool get validateAddress => (addressKey.currentState!.validate());

  void submitCreateAccDetails() async {
    isLoading(true);
    ReturnValue result = await _db.updateUser({
      "fullName": fullName,
      "address": address,
      "unitNum": unitNum,
    });
    isLoading(false);
    if (!result.success) {
      Get.showSnackbar(GetSnackBar(message: "Failed to create account! Please check your connection and try again."));
    }
  }
}
