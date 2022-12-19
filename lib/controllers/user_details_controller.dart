import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_user.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/services/firebase/firestore.dart";
import "package:the_hill_residence/shared/shared_classes.dart";

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

  RxBool isLoading = false.obs;

  // Getters - App User
  AppUser get appUser => authService.appUser;
  String? get fullName => appUser.fullName;
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

  void updateAddressDetails() async {
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
      Get.showSnackbar(GetSnackBar(message: "Failed to update address! Please check your connection and try again."));
      return;
    }
    appUser.unitNum = editedUnitNum;
    appUser.road = editedRoad;
    appUser.city = editedCity;
    appUser.postcode = editedPostcode;
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
