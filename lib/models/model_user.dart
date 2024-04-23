import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";
import "package:the_hill_residence/models/model_visitor.dart";
import "package:the_hill_residence/utilities/type_convert.dart";

class AppUser extends GetxController {
  // Auth identifiers
  final String? uid;
  final String? email;
  final String? phone;
  final String? provider;
  final bool isVerified;

  // Variables
  RxString fullName = "".obs;
  String? unitNum;
  String? street;
  String? city;
  String? state;
  String? postcode;
  String? unitId;
  Unit? unit;

  RxList<Visitor> pastVisitors = <Visitor>[].obs;
  RxList<Visitor> upcomingVisitors = <Visitor>[].obs;
  RxInt todayVisitors = 0.obs;

  AppUser({this.phone, this.provider, this.email, this.uid, this.isVerified = false});

  // Getters
  bool get hasProfileDetails =>
      fullName.isNotEmpty && unitNum != null && street != null && city != null && state != null && postcode != null;

  bool get hasUnitId => unitId != null;

  int get upcomingVisitorsNum => upcomingVisitors.length;

  String get visitorSummaryTitle {
    if (todayVisitors.value > 0) return "Stay alert";
    if (upcomingVisitorsNum > 0) return "Gentle reminder";
    return "No visitors";
  }

  String get visitorSummaryDescription {
    if (todayVisitors.value > 0) return "${todayVisitors.value} visitor(s) arriving today";
    if (upcomingVisitorsNum > 0) return "Awaiting $upcomingVisitorsNum visitor(s)";
    return "No visitors this week";
  }

  Color? get visitorSummaryCardColor {
    if (todayVisitors.value > 0) return Colors.red[700];
    if (upcomingVisitorsNum > 0) return Colors.amber[700];
    return null;
  }

  Color? get visitorSummaryImageColor {
    if (todayVisitors.value > 0) return Colors.red[100];
    if (upcomingVisitorsNum > 0) return Colors.amber[100];
    return null;
  }

  String get visitorSummaryImage {
    if (todayVisitors.value > 0) return "arrival-alert.png";
    if (upcomingVisitorsNum > 0) return "reminder.png";
    return "visitor-info.png";
  }

  // Methods
  void populatePastVisitors(List<Visitor> visitors) => pastVisitors(visitors);

  void populateUpcomingVisitors(List<Visitor> visitors) {
    todayVisitors.value = 0;
    upcomingVisitors.value = [];
    if (visitors.isNotEmpty) {
      for (var visitor in visitors) {
        if (visitor.entryDate.isAfter(DateTime.now().subtract(Duration(days: 1)))) {
          if (visitor.entryDate == MyTypeConvert().removeTimeSpecifier(DateTime.now())) {
            todayVisitors.value++;
          }
          upcomingVisitors.add(visitor);
        }
      }
    }
    upcomingVisitors.sort((a, b) => a.entryDate.compareTo(b.entryDate));
    todayVisitors.refresh();
  }
}
