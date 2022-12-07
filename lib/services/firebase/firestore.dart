import "package:cloud_firestore/cloud_firestore.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_user.dart";

class DatabaseService extends GetxController {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");

  void createNewUser(String uid, String email) async {
    await usersCollection.doc(uid).set({"email": email});
  }

  Future<AppUser> initUser(AppUser appUser) async {
    try {
      final DocumentSnapshot doc = await usersCollection.doc(appUser.uid).get();
      if (!doc.exists) {
        createNewUser(appUser.uid!, appUser.email!);
        return appUser;
      }
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      appUser.firstName = data["firstName"]?.toString();
      appUser.lastName = data["lastName"]?.toString();
      appUser.address = data["address"]?.toString();
      appUser.unitNum = data["unitNum"]?.toString();
      return (appUser);
    } catch (err) {
      print("No user found! ${err.toString()}");
      return AppUser();
    }
  }
}
