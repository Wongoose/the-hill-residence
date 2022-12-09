import "package:cloud_firestore/cloud_firestore.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_user.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/shared/shared_classes.dart";

class DatabaseService extends GetxController {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
  late AuthService authService;

  // Getters
  AppUser get appUser => authService.appUser;

  // Methods
  void createNewUser(String uid, String email) async {
    await usersCollection.doc(uid).set({"email": email});
  }

  Future<void> initUser(AppUser appUser) async {
    try {
      authService = Get.find();
      final DocumentSnapshot doc = await usersCollection.doc(appUser.uid).get();
      if (!doc.exists) {
        createNewUser(appUser.uid!, appUser.email!);
        return;
      }
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      appUser.firstName = data["firstName"]?.toString();
      appUser.lastName = data["lastName"]?.toString();
      appUser.address = data["address"]?.toString();
      appUser.unitNum = data["unitNum"]?.toString();
    } catch (err) {
      return;
    }
  }

  Future<ReturnValue> updateUser(Map<String, dynamic> data) async {
    try {
      await usersCollection.doc(appUser.uid).update(data);
      authService.reload();
      return (ReturnValue(true, ""));
    } catch (err) {
      return (ReturnValue(false, err.toString()));
    }
  }
}
