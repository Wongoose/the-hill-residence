import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_user.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/services/firebase/firestore.dart";
import "package:the_hill_residence/shared/shared_classes.dart";

class UserDetailsController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController unitNumController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> fullNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addressKey = GlobalKey<FormState>();
  final DatabaseService _db = Get.find();
  final AuthService authService = Get.find();

  RxBool isLoading = false.obs;

  // Getters - App User
  AppUser get appUser => authService.appUser;
  String? get fullName => appUser.fullName;
  String? get address => appUser.address;
  String? get unitNum => appUser.unitNum;
  String? get email => appUser.email;

  // Getters - Editing details
  String get editedFullName => (fullNameController.text.trim());
  String get editedAddress => (addressController.text.trim());
  String get editedUnitNum => (unitNumController.text.trim());
  String get editedEmail => (emailController.text.trim());
  bool get validateFullName => (fullNameKey.currentState!.validate());
  bool get validateAddress => (addressKey.currentState!.validate());

  // Methods
  void submitCreateAccDetails() async {
    isLoading(true);
    ReturnValue result = await _db.updateUser({
      "fullName": editedFullName,
      "address": editedAddress,
      "unitNum": editedUnitNum,
    });
    isLoading(false);
    if (!result.success) {
      Get.showSnackbar(GetSnackBar(message: "Failed to create account! Please check your connection and try again."));
    }
  }

  void updateFullName() async {
    isLoading(true);
    // NEXT: Validation
    ReturnValue result = await _db.updateUser({"fullName": editedFullName});
    isLoading(false);
    if (!result.success) {
      Get.showSnackbar(GetSnackBar(message: "Failed to create account! Please check your connection and try again."));
      return;
    }
    appUser.fullName = editedFullName;
  }

  void updateAddressAndUnitNum() async {
    isLoading(true);
    // NEXT: Validation
    ReturnValue result = await _db.updateUser({"address": editedAddress, "unitNum": editedUnitNum});
    isLoading(false);
    if (!result.success) {
      Get.showSnackbar(GetSnackBar(message: "Failed to create account! Please check your connection and try again."));
      return;
    }
    appUser.address = editedAddress;
    appUser.unitNum = editedUnitNum;
  }

  void updateEmail() async {
    isLoading(true);
    // NEXT: Validation
    // NEXT: Authentication
    // NEXT: Send verification
    // ReturnValue result = await _db.updateUser({"fullName": editedFullName});
    // isLoading(false);
    // if (!result.success) {
    //   Get.showSnackbar(GetSnackBar(message: "Failed to create account! Please check your connection and try again."));
    //   return;
    // }
    // appUser.fullName = editedFullName;
  }
}
