import 'package:flutter/material.dart';
import "package:the_hill_residence/shared/constants.dart";
import 'package:the_hill_residence/utilities/type_convert.dart';

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
    final String day = myWeekDayArray[entryDate.weekday - 1];
    final String date = entryDate.day.toString();
    final String month = myMonthArray[entryDate.month - 1];
    final String year = entryDate.year.toString();
    return ("$day, $date $month $year");
  }

  String get exitDateDisplay {
    final String day = myWeekDayArray[exitDate.weekday - 1];
    final String date = exitDate.day.toString();
    final String month = myMonthArray[exitDate.month - 1];
    final String year = exitDate.year.toString();
    return ("$day, $date $month $year");
  }

  String get registerDateDisplay {
    if (registeredDate == null) return "";
    final String day = myWeekDayArray[registeredDate!.weekday - 1];
    final String date = registeredDate!.day.toString();
    final String month = myMonthArray[registeredDate!.month - 1];
    final String year = registeredDate!.year.toString();
    return ("$day, $date $month $year");
  }

  String get dialogDateDisplay => ("$entryDateDisplay (in)\n$exitDateDisplay (out)");

  String get getDisplayArrival {
    switch (entryDate.difference(MyTypeConvert().removeTimeSpecifier(DateTime.now())).inDays) {
      case 0:
        return ("today");
      case 1:
        return ("tomorrow");
      default:
        return ("on $entryDateDisplay");
    }
  }

  String get listIconImage {
    if (entryDate == MyTypeConvert().removeTimeSpecifier(DateTime.now())) return "arrival-alert.png";
    return "reminder.png";
  }

  Color? get listIconColor {
    if (entryDate == MyTypeConvert().removeTimeSpecifier(DateTime.now())) return Colors.red.withOpacity(0.1);
    return Colors.amber.withOpacity(0.1);
  }
}
