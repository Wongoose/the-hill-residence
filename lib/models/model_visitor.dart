import 'package:flutter/material.dart';
import "package:the_hill_residence/shared/constants.dart";

class Visitor {
  final String name;
  final String phone;
  final DateTime entryDate;
  final DateTime exitDate;
  DateTime? registeredDate;

  // Variables
  String? id;

  Visitor(
      {required this.entryDate, required this.exitDate, required this.phone, required this.name, this.registeredDate});

  // Getters - Visitor dates display
  String get entryDateDisplay {
    final String day = entryDate.day.toString();
    final String month = myMonthArray[entryDate.month - 1];
    final String year = entryDate.year.toString();
    return ("$day $month $year");
  }

  String get exitDateDisplay {
    final String day = exitDate.day.toString();
    final String month = myMonthArray[exitDate.month - 1];
    final String year = exitDate.year.toString();
    return ("$day $month $year");
  }

  String get registerDateDisplay {
    if (registeredDate == null) return "";
    final String day = registeredDate!.day.toString();
    final String month = myMonthArray[registeredDate!.month - 1];
    final String year = registeredDate!.year.toString();
    return ("$day $month $year");
  }

  String get dialogDateDisplay => ("$entryDateDisplay to $exitDateDisplay");

  String get getDisplayArrival {
    switch (entryDate.day - DateTime.now().day) {
      case 0:
        return ("today");
      case 1:
        return ("tomorrow");
      default:
        return ("on $entryDateDisplay");
    }
  }

  String get listIconImage {
    if (entryDate.day == DateTime.now().day) return "arrival-alert.png";
    return "reminder.png";
  }

  Color? get listIconColor {
    if (entryDate.day == DateTime.now().day) return Colors.red.withOpacity(0.1);
    return Colors.amber.withOpacity(0.1);
  }
}
