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
  String? access;
  Unit? unit;
  RxString profileImageUrl = "".obs;

  RxList<Visitor> pastVisitors = <Visitor>[].obs;
  RxList<Visitor> upcomingVisitors = <Visitor>[].obs;
  RxInt todayVisitors = 0.obs;

  AppUser({this.phone, this.provider, this.email, this.uid, this.isVerified = false});

  // Getters
  bool get hasProfileDetails =>
      fullName.isNotEmpty && unitNum != null && street != null && city != null && state != null && postcode != null;

  bool get hasUnitId => unitId != null && unitId!.isNotEmpty;
  bool get isUnitOwner => unit?.ownerUID == uid;

  String get getUnitAlias => unit?.unitAlias ?? "No registered unit";

  bool get isNew => access == null || access!.isEmpty;
  bool get isGuest => access == "guest";
  bool get isUser => access == "user";
  bool get isSuperUser => access == "superuser";
  String get accessDisplay => isGuest
      ? "Guest"
      : isUser
          ? isUnitOwner
              ? "Owner"
              : "Resident"
          : isSuperUser
              ? "Administrator"
              : "None";

  int get upcomingVisitorsNum => upcomingVisitors.length;

  String get myResidentsDisplay {
    final List<String> displayNames = [];
    final Unit? unit = this.unit;
    if (unit == null) return "You";

    displayNames.add("You");
    displayNames.add(unit.ownerName);
    displayNames.addAll(unit.residentNames);
    displayNames.remove(fullName.value); // Remove personal name replaced with "You" in front
    if (displayNames.length == 1) return (displayNames[0]);
    if (displayNames.length == 2) return ("${displayNames[0]} and ${displayNames[1]}");
    if (displayNames.length > 2) {
      return ("${displayNames[0]}, ${displayNames[1]} and ${displayNames.length - 2} more");
    }
    return ("No residents");
  }

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
