import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";

class AdminController extends GetxController {
  final TextEditingController uniqueIdentifierController = TextEditingController();
  final TextEditingController ownerEmailController = TextEditingController();
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference unitsCollection = FirebaseFirestore.instance.collection("units");

  // Variables
  RxList<Account> accounts = <Account>[].obs;
  RxList<Unit> units = <Unit>[].obs;
  bool activation = true;
  RxBool loading = false.obs;
  RxBool checkerLoading = true.obs;
  RxBool isUnique = true.obs;

  // Getters
  String get uniqueIdentifier => (uniqueIdentifierController.text.trim());
  String get ownerEmail => (ownerEmailController.text.trim());
  bool get newUnitInputComplete =>
      (uniqueIdentifier.isNotEmpty && isUnique.value && checkerLoading.value == false && ownerEmail.isNotEmpty);

  // Methods
  Future<void> getAccounts() async {
    try {
      final List<Account> result = [];
      final QuerySnapshot snapshot = await usersCollection.get();
      snapshot.docs.forEach((doc) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        result.add(Account(
            name: data["fullName"],
            uniqueIdentifier: data["uniqueIdentifier"],
            address: "${data["unitNum"]}, ${data["street"]}",
            phone: data["phone"] ?? ""));
      });
      accounts(result);
    } catch (err) {
      print("Failed with catch err: ${err.toString()}");
    }
  }

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
      final List<Unit> result = [];
      final QuerySnapshot snapshot = await unitsCollection.get();

      await Future.forEach<QueryDocumentSnapshot<Object?>>(snapshot.docs, (doc) async {
        if (!doc.exists) return;
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final List<String> residentIDs = (data["residentsUID"] as List).map((item) => item as String).toList();
        result.add(Unit(
          id: doc.id,
          ownerName: await getNameFromID(data["ownerUID"]) ?? "No owner",
          uniqueIdentifier: data["uniqueIdentifier"],
          residentNames: await getResidentNames(residentIDs),
          activated: data["activation"] as bool,
        ));
      });
      units(result);
    } catch (err) {
      print("Failed with catch err: ${err.toString()}");
    }
  }

  Future<void> createNewUnit() async {
    try {
      if (!newUnitInputComplete) return;
      loading(true);
      await unitsCollection.add({
        "activation": activation,
        "ownerEmail": ownerEmail,
        "ownerUID": null,
        "registeredAddress": null,
        "residentsUID": [],
        "uniqueIdentifier": uniqueIdentifier,
        "verificationStatus":
            "complete", // complete because owner creates and verifies already, waiting on owner to accept request
      });
      loading(false);
      Get.snackbar("Success", "Add new unit successful!");
      getUnits();
    } catch (err) {
      loading(false);
      print("Failed with catch err: ${err.toString()}");
      Get.snackbar("Couldn't add new unit", err.toString());
    }
  }

  Future<void> checkUniqueIdentifier(String? uniqueIdentifier) async {
    try {
      if (uniqueIdentifier == null) return;
      final QuerySnapshot snapshot = await unitsCollection.where("uniqueIdentifier", isEqualTo: uniqueIdentifier).get();
      isUnique(snapshot.size == 0);
    } catch (err) {
      isUnique(false);
      print("Failed with catch err: ${err.toString()}");
    }
  }

  Future<void> updateUnitActivation(Unit unit) async {
    String activation = unit.activated ? "Activate" : "Deactivate";
    try {
      await unitsCollection.doc(unit.id).update({"activation": unit.activated});
      Get.snackbar(activation, "$activation unit successful!");
    } catch (err) { 
      print("Failed with catch err: ${err.toString()}");
      Get.snackbar("Couldn't $activation unit", err.toString());
    }
  }

  Future<void> deleteUnit(Unit unit) async {
    try {
      await unitsCollection.doc(unit.id).delete();
      Get.back();
      Get.back();
      Get.snackbar("Deleted", "This unit is deleted.", dismissDirection: DismissDirection.horizontal);
      getUnits();
    } catch (err) {
      Get.snackbar("Couldn't delete unit", err.toString());
    }
  }
}
