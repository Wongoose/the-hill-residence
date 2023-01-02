import "package:get/get.dart";
import "package:the_hill_residence/models/model_visitor.dart";

class AppUser extends GetxController {
  // Auth identifiers
  final String? uid;
  final String? email;
  final String? provider;
  final bool isVerified;

  // Variables
  RxString fullName = "".obs;
  String? unitNum;
  String? street;
  String? city;
  String? postcode;

  List<Visitor> pastVisitors = [];
  List<Visitor> upcomingVisitors = [];

  AppUser({this.provider, this.email, this.uid, this.isVerified = false});

  // Getters
  bool get hasProfileDetails =>
      fullName.isNotEmpty && unitNum != null && street != null && city != null && postcode != null;

  // Methods
  void populatePastVisitors(List<Visitor> visitors) => pastVisitors = visitors;

  void populateUpcomingVisitors(List<Visitor> visitors) {
    upcomingVisitors = [];
    for (var visitor in visitors) {
      if (visitor.entryDate.difference(DateTime.now()).inDays < 7 &&
          visitor.entryDate.isAfter(DateTime.now().subtract(Duration(days: 1)))) {
        upcomingVisitors.add(visitor);
      }
    }
    upcomingVisitors.sort((a, b) => a.entryDate.compareTo(b.entryDate));
  }
}
