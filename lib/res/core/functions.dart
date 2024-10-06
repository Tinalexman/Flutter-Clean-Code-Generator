String dateTimeFunctions(String projectName) {
    return
"""
import 'package:intl/intl.dart';
import 'package:$projectName/core/extensions/date_time.dart';


String formatDate(String dateTime,
    {bool shorten = false, bool withTime = false}) {
  int firIndex = dateTime.indexOf("/");
  String d = dateTime.substring(0, firIndex);
  int secIndex = dateTime.indexOf("/", firIndex + 1);
  String m = dateTime.substring(firIndex + 1, secIndex);
  String y = dateTime.substring(secIndex + 1);

  return "\${month(m, shorten)} \${day(d)}, \$y";
}

bool isLeapYear(int year) {
  if (year % 4 == 0) {
    if (year % 100 == 0) {
      return year % 400 == 0;
    } else {
      return true;
    }
  } else {
    return false;
  }
}

int getDaysOfMonth(int month, int year) {
  if (month == 4 || month == 6 || month == 9 || month == 11) return 30;
  if (month == 2) {
    return isLeapYear(year) ? 29 : 28;
  }
  return 31;
}

String getWeekDay(int day, {bool shorten = false}) {
  switch (day) {
    case 1:
      return shorten ? "Mon" : "Monday";
    case 2:
      return shorten ? "Tue" : "Tuesday";
    case 3:
      return shorten ? "Wed" : "Wednesday";
    case 4:
      return shorten ? "Thur" : "Thursday";
    case 5:
      return shorten ? "Fri" : "Friday";
    case 6:
      return shorten ? "Sat" : "Saturday";
    case 7:
      return shorten ? "Sun" : "Sunday";
    default:
      return "";
  }
}

String month(String val, bool shorten) {
  int month = int.parse(val);
  switch (month) {
    case 1:
      return shorten ? "Jan" : "January";
    case 2:
      return shorten ? "Feb" : "February";
    case 3:
      return shorten ? "Mar" : "March";
    case 4:
      return shorten ? "Apr" : "April";
    case 5:
      return "May";
    case 6:
      return shorten ? "Jun" : "June";
    case 7:
      return shorten ? "Jul" : "July";
    case 8:
      return shorten ? "Aug" : "August";
    case 9:
      return shorten ? "Sep" : "September";
    case 10:
      return shorten ? "Oct" : "October";
    case 11:
      return shorten ? "Nov" : "November";
    default:
      return shorten ? "Dec" : "December";
  }
}

String day(String val) {
  int day = int.parse(val);
  int remainder = day % 10;
  switch (remainder) {
    case 1:
      return (day == 11) ? "\${day}th" : "\${day}st";
    case 2:
      return (day == 12) ? "\${day}th" : "\${day}nd";
    case 3:
      return (day == 13) ? "\${day}th" : "\${day}rd";
    default:
      return "\${day}th";
  }
}

String formatDateRawWithTime(DateTime date, {bool shorten = false}) =>
    "\${formatDate(DateFormat("dd/MM/yyy").format(date), shorten: shorten)}: \${convertTime(date)}";

String formatDateRaw(DateTime date, {bool shorten = false}) =>
    formatDate(DateFormat("dd/MM/yyy").format(date), shorten: shorten);

String formatDuration(int total) {
  int hr = total ~/ 3600;
  int min = total ~/ 60;
  int secs = total - ((hr * 3600) - (min * 60));
  return "\${hr < 10 ? "0" : ""}\$hr:\${min < 10 ? "0" : ""}\$min:\${secs < 10 ? "0" : ""}\$secs";
}

String convertTime(DateTime date) {
  bool isPM = date.hour > 11;
  int hours = date.hour;
  int minutes = date.minute;
  return "\${hours == 0 ? "" : hours % 12 < 10 ? "0" : ""}\${hours == 0 || hours % 12 == 0 ? "12" : hours % 12}:\${minutes < 10 ? "0" : ""}\$minutes \${isPM ? "PM" : "AM"}";
}

class DateUtilities {
  static DateTime getDaysAgo(int day) {
    return DateTime.now().subtract(Duration(days: day));
  }

  static DateTime getDaysAhead(int day) {
    return DateTime.now().add(Duration(days: day));
  }

  static DateTime getMinutesBefore(int minutes) {
    return DateTime.now().subtract(Duration(minutes: minutes));
  }

  static DateTime getCurrentWeekStart() {
    return DateTime.now().startOfWeek;
  }

  static DateTime getCurrentWeekEnd() {
    return DateTime.now().endOfWeek;
  }

  static DateTime getLastWeekStart() {
    return DateTime.now().subtract(const Duration(days: 7)).startOfWeek;
  }

  static DateTime getLastWeekEnd() {
    return DateTime.now().subtract(const Duration(days: 7)).endOfWeek;
  }

  static DateTime getCurrentMonthStart() {
    return DateTime(DateTime.now().year, DateTime.now().month, 1);
  }

  static DateTime getCurrentMonthEnd() {
    return DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
  }

  static DateTime getLastMonthStart() {
    return DateTime.now().subtract(const Duration(days: 30)).startOfMonth;
  }

  static DateTime getLastMonthEnd() {
    return DateTime.now().subtract(const Duration(days: 30)).endOfMonth;
  }

  static DateTime getPreviousMonthStart() {
    return DateTime.now().subtract(const Duration(days: 30)).startOfMonth;
  }

  static DateTime getPreviousMonthEnd() {
    return DateTime.now().subtract(const Duration(days: 30)).endOfMonth;
  }

  static DateTime getYearsAhead(int years) {
    return DateTime.now().add(Duration(days: 365 * years));
  }

  static DateTime getThreeMonthsAgoStart() {
    return DateTime.now().subtract(const Duration(days: 90));
  }

  static DateTime getThreeMonthsAgoEnd() {
    return DateTime.now().subtract(const Duration(days: 90)).endOfMonth;
  }
}
    
    """;
}

String get numberFunctions {
    return
    """
    String formatRawAmount(int price) => formatAmount(price.toString());

    String formatAmount(String price) {
      String priceInText = "";
      int counter = 0;
      for (int i = (price.length - 1); i >= 0; i--) {
        counter++;
        String str = price[i];
        if ((counter % 3) != 0 && i != 0) {
          priceInText = "\$str\$priceInText";
        } else if (i == 0) {
          priceInText = "\$str\$priceInText";
        } else {
          priceInText = ",\$str\$priceInText";
        }
      }
      return priceInText.trim();
    }   
    
    """;
}


String get functionExport {
    return """
    export 'date_time.dart';
    export 'number.dart';
    """;
}
