import "package:cloud_firestore/cloud_firestore.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";

class AdminController extends GetxController {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference unitsCollection = FirebaseFirestore.instance.collection("units");

  // Variables
  RxList<Account> accounts = <Account>[].obs;
  RxList<Unit> units = <Unit>[].obs;

  // Methods
  Future<void> getAccounts() async {
    try {
      final List<Account> result = [];
      final QuerySnapshot snapshot = await usersCollection.get();
      snapshot.docs.forEach((doc) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        result.add(Account(
            name: data["fullName"],
            uniqueAddress: data["uniqueAddress"],
            address: "${data["unitNum"]}, ${data["street"]}",
            phone: data["phone"] ?? ""));
      });
      accounts(result);
    } catch (err) {
      print("Failed with catch err: ${err.toString()}");
    }
  }

  Future<String?> getNameFromID(String uid) async {
    try {
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
        // insert owner at the front
        result.add(Unit(
          ownerName: await getNameFromID(data["ownerUID"]) ?? "No owner",
          uniqueAddress: data["uniqueAddress"],
          residentNames: await getResidentNames(residentIDs),
        ));
      });
      units(result);
    } catch (err) {
      print("Failed with catch err: ${err.toString()}");
    }
  }
}
