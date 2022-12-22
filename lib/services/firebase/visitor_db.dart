import "package:cloud_firestore/cloud_firestore.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_user.dart";
import "package:the_hill_residence/models/model_visitor.dart";
import "package:the_hill_residence/services/firebase/auth.dart";

class VisitorDBService extends GetxController {
  final CollectionReference visitorsCollection = FirebaseFirestore.instance.collection("visitors");
  late AuthService authService = Get.find();

  // Getters
  AppUser get appUser => authService.appUser;

  // Methods
  void createNewVisitor(Visitor visitor) async {
    try {
      visitorsCollection.add({
        "name": visitor.name,
        "phone": visitor.phone,
        "entryDate": visitor.entryDateDisplay,
        "exitDate": visitor.exitDateDisplay,
        "residentUID": appUser.uid,
      });
    } catch (err) {
      Get.showSnackbar(GetSnackBar(message: "Failed to register visitor! $err", duration: Duration(seconds: 2)));
    }
  }
}
