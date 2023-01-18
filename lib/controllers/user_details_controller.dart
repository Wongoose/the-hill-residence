import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_user.dart";
import "package:the_hill_residence/screens/auth/pages/auth_sign_in.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/services/firebase/firestore.dart";
import "package:the_hill_residence/shared/my_confirm_dialog.dart";
import "package:the_hill_residence/shared/open_inbox.dart";
import "package:the_hill_residence/shared/shared_classes.dart";

class UserDetailsController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController unitNumController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
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
  String? get street => appUser.street;
  String? get city => appUser.city;
  String? get state => appUser.state;
  String? get postcode => appUser.postcode;
  String? get email => appUser.email;

  // Getters - Editing details
  String get editedFullName => (fullNameController.text.trim());
  String get editedUnitNum => (unitNumController.text.trim());
  String get editedStreet => (streetController.text.trim());
  String get editedCity => (cityController.text.trim());
  String get editedState => (stateController.text.trim());
  String get editedPostcode => (postcodeController.text.trim());
  String get editedEmail => (emailController.text.trim());
  bool get validateFullName => (fullNameKey.currentState!.validate());
  bool get validateAddress => (addressKey.currentState!.validate());

  // Methods - Editing details
  void updateEditChanges() {
    fullNameHasChanges.value = editedFullName != fullName;
    emailHasChanges.value = editedEmail != email;
    addressHasChanges.value = "$editedUnitNum, $editedStreet, $editedCity, $editedState, $editedPostcode" !=
        "$unitNum, $street, $city, $state, $postcode";
  }

  // Methods
  void submitCreateAccDetails() async {
    isLoading(true);
    ReturnValue result = await _db.updateUser({
      "fullName": editedFullName,
      "unitNum": editedUnitNum,
      "street": editedStreet,
      "city": editedCity,
      "state": editedState,
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
      "street": editedStreet,
      "city": editedCity,
      "state": editedState,
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
    appUser.street = editedStreet;
    appUser.city = editedCity;
    appUser.state = editedState;
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
      Get.showSnackbar(GetSnackBar(message: "Failed to update email! ${result.value}", duration: Duration(seconds: 3)));
      return;
    }
    // SUCCESS
    Get.to(
      () => OpenInboxScreen(
          description:
              "A verification email was sent to $editedEmail.  If you do not see the email in a few minutes, check your junk mail or spam folder.",
          completedMessage: "Click here after verifiying your email",
          completeFunction: () => Get.dialog(MyConfirmDialog(
              title: "Email updated",
              body: "Once verified, you can login with your new email address.",
              actionText: "Login",
              actionFunction: () => Get.offAll(() => AuthSignIn(preEmail: editedEmail))))),
    );
  }
}
