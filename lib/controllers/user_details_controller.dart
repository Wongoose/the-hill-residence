import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_user.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/services/firebase/firestore.dart";
import "package:the_hill_residence/shared/shared_classes.dart";
import "package:the_hill_residence/utilities/navigation.dart";

class UserDetailsController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController unitNumController = TextEditingController();
  final TextEditingController roadController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postcodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> fullNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addressKey = GlobalKey<FormState>();
  final DatabaseService _db = Get.find();
  final AuthService authService = Get.find();

  // Rx vars - editing changes
  RxBool isLoading = false.obs;
  RxBool fullNameHasChanges = false.obs;
  RxBool emailHasChanges = false.obs;
  RxBool addressHasChanges = false.obs;

  // Getters - App User
  AppUser get appUser => authService.appUser;
  String? get fullName => appUser.fullName.value;
  String? get unitNum => appUser.unitNum;
  String? get road => appUser.road;
  String? get city => appUser.city;
  String? get postcode => appUser.postcode;
  String? get email => appUser.email;

  // Getters - Editing details
  String get editedFullName => (fullNameController.text.trim());
  String get editedUnitNum => (unitNumController.text.trim());
  String get editedRoad => (roadController.text.trim());
  String get editedCity => (cityController.text.trim());
  String get editedPostcode => (postcodeController.text.trim());
  String get editedEmail => (emailController.text.trim());
  bool get validateFullName => (fullNameKey.currentState!.validate());
  bool get validateAddress => (addressKey.currentState!.validate());

  // Methods - Editing details
  void updateEditChanges() {
    fullNameHasChanges.value = editedFullName != fullName;
    emailHasChanges.value = editedEmail != email;
    addressHasChanges.value =
        "$editedUnitNum, $editedRoad, $editedCity, $editedPostcode" != "$unitNum, $road, $city, $postcode";
  }

  // Methods
  void submitCreateAccDetails() async {
    isLoading(true);
    ReturnValue result = await _db.updateUser({
      "fullName": editedFullName,
      "unitNum": editedUnitNum,
      "road": editedRoad,
      "city": editedCity,
      "postcode": editedPostcode,
    });
    isLoading(false);
    if (!result.success) {
      Get.showSnackbar(GetSnackBar(
          message: "Failed to create account! Please check your connection and try again.",
          duration: Duration(seconds: 2)));
    }
  }

  void updateFullName() async {
    if (!fullNameHasChanges.value) return;
    // NEXT: Validation
    isLoading(true);
    ReturnValue result = await _db.updateUser({"fullName": editedFullName});
    isLoading(false);
    if (!result.success) {
      Get.showSnackbar(GetSnackBar(
          message: "Failed to update name! Please check your connection and try again.",
          duration: Duration(seconds: 2)));
      return;
    }
    appUser.fullName.value = editedFullName;
    Get.back();
  }

  void updateAddressDetails() async {
    if (!addressHasChanges.value) return;
    isLoading(true);
    // NEXT: Validation
    ReturnValue result = await _db.updateUser({
      "unitNum": editedUnitNum,
      "road": editedRoad,
      "city": editedCity,
      "postcode": editedPostcode,
    });
    isLoading(false);
    if (!result.success) {
      Get.showSnackbar(GetSnackBar(
          message: "Failed to update address! Please check your connection and try again.",
          duration: Duration(seconds: 2)));
      return;
    }
    appUser.unitNum = editedUnitNum;
    appUser.road = editedRoad;
    appUser.city = editedCity;
    appUser.postcode = editedPostcode;
    Get.back();
  }

  void updateEmail() async {
    if (!emailHasChanges.value) return;
    isLoading(true);
    // NEXT: Validation
    ReturnValue result = await authService.sendUpdateVerificationEmail(editedEmail);
    isLoading(false);
    if (!result.success) {
      Get.showSnackbar(GetSnackBar(message: "Failed to update email! ${result.value}", duration: Duration(seconds: 2)));
      return;
    }
    // SUCCESS
    navigateToOpenInboxScreen(
        "A verification email was sent to $editedEmail. Please follow the steps to change your email.");
  }
}
