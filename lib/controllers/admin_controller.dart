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
      for (var doc in snapshot.docs) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        result.add(Account(
            name: data["fullName"],
            uniqueAddress: data["uniqueAddress"],
            address: "${data["unitNum"]}, ${data["street"]}",
            phone: data["phone"] ?? ""));
      }
      accounts(result);
    } catch (err) {
      print("Failed with catch err: ${err.toString()}");
    }
  }

  Future<String?> getNameFromID(String docID) async {
    try {
      final DocumentSnapshot doc = await usersCollection.doc(docID).get();
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return (data["fullName"]);
    } catch (err) {
      print("Failed with catch err: ${err.toString()}");
      return (null);
    }
  }

  // NEXT: Fix bug resident display not showing
  Future<void> getUnits() async {
    try {
      final List<Unit> result = [];
      final QuerySnapshot snapshot = await unitsCollection.get();
      snapshot.docs.forEach((doc) async {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final Unit unit = Unit(
          ownerUID: data["ownerUID"],
          uniqueAddress: data["uniqueAddress"],
        );
        // Dummy
        unit.residentNames.addAll(["Wong ZX", "David Goh"]);
        result.add(unit);
      });
      units(result);
    } catch (err) {
      print("Failed with catch err: ${err.toString()}");
    }
  }
}
