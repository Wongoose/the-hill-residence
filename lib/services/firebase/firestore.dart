import "package:cloud_firestore/cloud_firestore.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/user_details_controller.dart";
import "package:the_hill_residence/models/model_user.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/shared/shared_classes.dart";

class DatabaseService extends GetxController {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference supportCollection = FirebaseFirestore.instance.collection("support");
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
      appUser.fullName.value = data["fullName"].toString();
      appUser.unitNum = data["unitNum"]?.toString();
      appUser.street = data["street"]?.toString();
      appUser.city = data["city"]?.toString();
      appUser.state = data["state"]?.toString();
      appUser.postcode = data["postcode"]?.toString();
      appUser.unitId = data["unitId"]?.toString();
      appUser.access = data["access"]?.toString();
      appUser.profileImageUrl.value = data["profileImageUrl"] ?? "";

      await UserDetailsController().updateUserUnit();

      // Syncing auth email to firestore
      if (appUser.isVerified) {
        await usersCollection.doc(appUser.uid).update({"email": appUser.email, "phone": appUser.phone});
      }
    } catch (err) {
      return;
    }
  }

  Future<ReturnValue> updateUser(Map<String, dynamic> data) async {
    try {
      await usersCollection.doc(appUser.uid).update(data);
      return (ReturnValue(true, ""));
    } catch (err) {
      return (ReturnValue(false, err.toString()));
    }
  }

  Future<ReturnValue> submitReportProblem(String string) async {
    try {
      await supportCollection.add({
        "residentUID": appUser.uid,
        "name": appUser.fullName.value,
        "email": appUser.email,
        "problem": string,
      });

      return (ReturnValue(true, ""));
    } catch (err) {
      print("Failed with catch err: $err");
      return (ReturnValue(false, err.toString()));
    }
  }
}
