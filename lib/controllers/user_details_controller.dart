import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";
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

  // Database
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference unitsCollection = FirebaseFirestore.instance.collection("units");

  // Rx vars - editing changes
  RxBool isLoading = false.obs;
  RxBool fullNameHasChanges = false.obs;
  RxBool emailHasChanges = false.obs;
  RxBool addressHasChanges = false.obs;
  RxList<Unit> units = <Unit>[].obs;

  // Getters - App User
  AppUser get appUser => authService.appUser;
  String get access => appUser.accessDisplay;
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
  void acceptUnitInvitation(Unit unit) async {
    try {
      isLoading(true);
      await _db
          .updateUser({"fullName": editedFullName, "unitId": unit.id, "unitAlias": unit.unitAlias, "access": "user"});
      await unitsCollection.doc(unit.id).update({"ownerUID": appUser.uid});
      isLoading(false);
      authService.reload();
    } catch (err) {
      isLoading(false);
      Get.showSnackbar(GetSnackBar(
          message: "Failed to create account! Please check your connection and try again.",
          duration: Duration(seconds: 2)));
    }
  }

  // Continue as guest
  void continueAsGuest() async {
    try {
      isLoading(true);
      await _db.updateUser({"fullName": editedFullName, "unitId": null, "unitAlias": null, "access": "guest"});
      isLoading(false);
      authService.reload();
    } catch (err) {
      isLoading(false);
      Get.showSnackbar(GetSnackBar(
          message: "Failed to create account! Please check your connection and try again.",
          duration: Duration(seconds: 2)));
    }
  }

  // Invite new family member
  void inviteNewMember(String invitedEmail) async {
    try {
      isLoading(true);
      if (!appUser.hasUnitId) throw "You don't have a unit. Cannot invite new member.";
      if (!appUser.isUnitOwner) throw "You are not the owner. Cannot invite new member.";
      await unitsCollection.doc(appUser.unitId).update({
        "invitedEmails": FieldValue.arrayUnion([invitedEmail])
      });
      isLoading(false);
    } catch (err) {
      isLoading(false);
      Get.showSnackbar(GetSnackBar(message: err.toString(), duration: Duration(seconds: 2)));
    }
  }

  // Not used, using acceptUnitInvitation instead
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

  // Database functions
  Future<String?> getNameFromID(String? uid) async {
    try {
      if (uid == null) return (null);
      final DocumentSnapshot doc = await usersCollection.doc(uid).get();
      if (!doc.exists) return (null);
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return (data["fullName"]);
    } catch (err) {
      print("Failed with catch err: ${err.toString()}");
      return (null);
    }
  }

  Future<List<String>> getResidentNames(List<dynamic> userIDs) async {
    try {
      final List<String> result = [];
      await Future.forEach<dynamic>(userIDs, (uid) async {
        final String? residentName = await getNameFromID(uid);
        if (residentName == null) return;
        result.add(residentName);
      });
      return (result);
    } catch (err) {
      print("Failed with catch err: ${err.toString()}");
      return ([]);
    }
  }

  Future<void> getUnits() async {
    try {
      isLoading(true);
      final List<Unit> result = [];
      final QuerySnapshot snapshot = await unitsCollection.where("ownerEmail", isEqualTo: email).get();

      await Future.forEach<QueryDocumentSnapshot<Object?>>(snapshot.docs, (doc) async {
        if (!doc.exists) return;
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final List<String> residentIDs = (data["residentsUID"] as List).map((item) => item as String).toList();
        result.add(Unit(
          id: doc.id,
          ownerUID: data["ownerUID"],
          ownerName: await getNameFromID(data["ownerUID"]) ?? data["ownerEmail"],
          unitAlias: data["unitAlias"],
          residentNames: await getResidentNames(residentIDs),
          activated: data["activation"] as bool,
        ));
      });
      units(result);
      isLoading(false);
    } catch (err) {
      print("Failed with catch err: ${err.toString()}");
    }
  }

  Future<void> updateUserUnit() async {
    if (!appUser.hasUnitId) return;
    final DocumentSnapshot doc = await unitsCollection.doc(appUser.unitId).get();
    if (!doc.exists) return;
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final List<String> residentIDs = (data["residentsUID"] as List).map((item) => item as String).toList();
    final Unit unit = Unit(
      id: doc.id,
      ownerUID: data["ownerUID"],
      ownerName: await getNameFromID(data["ownerUID"]) ?? data["ownerEmail"],
      unitAlias: data["unitAlias"],
      residentNames: await getResidentNames(residentIDs),
      activated: data["activation"] as bool,
    );
    // Update Unit in AppUser
    appUser.unit = unit;
  }
}
