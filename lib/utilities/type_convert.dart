import "package:the_hill_residence/shared/constants.dart";

class MyTypeConvert {
  // Methods
  DateTime formatStringToDateTime(String dateString) {
    // Format to DD MMM YYY from i.e. "14 Jan 2023"
    late String date = dateString.split(" ")[0];
    final String month = dateString.split(" ")[1];
    final String year = dateString.split(" ")[2];
    late String monthNo;

    // Adding '0' to single digit date and month
    if (date.length < 2) date = "0$date";
    for (int i = 0; i < myMonthArray.length; i++) {
      if (myMonthArray[i] == month) {
        i++;
        monthNo = i.toString();
        if (i < 10) monthNo = "0$monthNo";
      }
    }
    return (DateTime.parse("$year$monthNo$date"));
  }

  DateTime removeTimeSpecifier(DateTime dateTime) {
    String date = dateTime.day.toString();
    String monthNo = dateTime.month.toString();
    String year = dateTime.year.toString();

    if (dateTime.month < 10) monthNo = "0$monthNo";
    if (dateTime.day < 10) date = "0$date";
    return (DateTime.parse("$year$monthNo$date"));
  }
}
