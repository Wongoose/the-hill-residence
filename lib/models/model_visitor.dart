import "package:the_hill_residence/shared/constants.dart";

class Visitor {
  final String name;
  final String phone;
  final DateTime entryDate;
  final DateTime exitDate;

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

  String get dialogDateDisplay => ("$entryDateDisplay to\n$exitDateDisplay");

  Visitor({required this.entryDate, required this.exitDate, required this.phone, required this.name});
}
