import "package:cloud_firestore/cloud_firestore.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_user.dart";
import "package:the_hill_residence/models/model_visitor.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/utilities/type_convert.dart";

class VisitorDBService extends GetxController {
  final CollectionReference visitorsCollection = FirebaseFirestore.instance.collection("visitors");
  late AuthService authService = Get.find();

  // Getters
  AppUser get appUser => authService.appUser;

  // Methods
  Future<String?> createNewVisitor(Visitor visitor) async {
    try {
      DocumentReference doc = await visitorsCollection.add({
        "name": visitor.name,
        "phone": visitor.phone,
        "entryDate": visitor.entryDateDisplay.substring(5),
        "exitDate": visitor.exitDateDisplay.substring(5),
        "residentUID": appUser.uid,
        "registerTimestamp": FieldValue.serverTimestamp(),
      });
      return (doc.id);
    } catch (err) {
      Get.showSnackbar(GetSnackBar(message: "Failed to register visitor! $err", duration: Duration(seconds: 2)));
      return (null);
    }
  }

  Future<void> getVisitors() async {
    try {
      final List<Visitor> visitors = [];
      QuerySnapshot snapshot = await visitorsCollection
          .where("residentUID", isEqualTo: appUser.uid)
          .orderBy("registerTimestamp", descending: true)
          .get();
      for (var doc in snapshot.docs) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        visitors.add(Visitor(
            entryDate: MyTypeConvert().formatStringToDateTime(data["entryDate"].toString()),
            exitDate: MyTypeConvert().formatStringToDateTime(data["exitDate"].toString()),
            registeredDate: (data["registerTimestamp"] as Timestamp).toDate(),
            phone: data["phone"],
            name: data["name"]));
      }
      appUser.populatePastVisitors(visitors);
      print("Visitor len: ${visitors.length}");
      appUser.populateUpcomingVisitors(visitors);
    } catch (err) {
      print("FAILED with catch errr: ${err.toString()}");
    }
  }
}
