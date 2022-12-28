import "package:the_hill_residence/shared/constants.dart";

class MyTypeConvert {
  DateTime formatStringToDateTime(String dateString) {
    // DD MON YYYY
    final String year = dateString.split(" ")[2];
    final String month = dateString.split(" ")[1];
    late String date = dateString.split(" ")[0];
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
    return DateTime.parse("$year$monthNo$date");
  }
}
