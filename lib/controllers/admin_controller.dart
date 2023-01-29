import "package:cloud_firestore/cloud_firestore.dart";
import "package:get/get.dart";

class Account {
  final String name;
  final String unitTag;
  final String address;
  final String phone;
  Account({required this.address, required this.phone, required this.name, required this.unitTag});
}

class AdminController extends GetxController {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");

  // Variables
  RxList<Account> accounts = <Account>[].obs;

  // Methods
  Future<void> getAccounts() async {
    try {
      List<Account> result = [];
      final QuerySnapshot snapshot = await usersCollection.get();
      for (var doc in snapshot.docs) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        result.add(Account(
            name: data["fullName"],
            unitTag: data["unitNum"],
            address: "${data["unitNum"]}, ${data["street"]}",
            phone: data["phone"] ?? ""));
      }
      accounts(result);
    } catch (err) {
      print("Failed with catch err: ${err.toString()}");
    }
  }
}
