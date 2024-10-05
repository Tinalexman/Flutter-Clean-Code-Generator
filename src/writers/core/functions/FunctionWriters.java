package writers.core.functions;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FunctionWriters
{

    public static void createFunctions(Path path, String projectName) throws IOException {
        createDateFunctions(path, projectName);
        createFocusFunctions(path);
        createNumberFunctions(path);
        createValidationFunctions(path);
        createExportFile(path);
    }

    private static void createDateFunctions(Path path, String projectName) throws IOException {
        String content = "import 'package:intl/intl.dart';\n" +
                "import 'package:" + projectName + "/core/extensions/date_time.dart';\n" +
                "\n" +
                "\n" +
                "String formatDate(String dateTime,\n" +
                "    {bool shorten = false, bool withTime = false}) {\n" +
                "  int firIndex = dateTime.indexOf(\"/\");\n" +
                "  String d = dateTime.substring(0, firIndex);\n" +
                "  int secIndex = dateTime.indexOf(\"/\", firIndex + 1);\n" +
                "  String m = dateTime.substring(firIndex + 1, secIndex);\n" +
                "  String y = dateTime.substring(secIndex + 1);\n" +
                "\n" +
                "  return \"${month(m, shorten)} ${day(d)}, $y\";\n" +
                "}\n" +
                "\n" +
                "bool isLeapYear(int year) {\n" +
                "  if (year % 4 == 0) {\n" +
                "    if (year % 100 == 0) {\n" +
                "      return year % 400 == 0;\n" +
                "    } else {\n" +
                "      return true;\n" +
                "    }\n" +
                "  } else {\n" +
                "    return false;\n" +
                "  }\n" +
                "}\n" +
                "\n" +
                "int getDaysOfMonth(int month, int year) {\n" +
                "  if (month == 4 || month == 6 || month == 9 || month == 11) return 30;\n" +
                "  if (month == 2) {\n" +
                "    return isLeapYear(year) ? 29 : 28;\n" +
                "  }\n" +
                "  return 31;\n" +
                "}\n" +
                "\n" +
                "String getWeekDay(int day, {bool shorten = false}) {\n" +
                "  switch (day) {\n" +
                "    case 1:\n" +
                "      return shorten ? \"Mon\" : \"Monday\";\n" +
                "    case 2:\n" +
                "      return shorten ? \"Tue\" : \"Tuesday\";\n" +
                "    case 3:\n" +
                "      return shorten ? \"Wed\" : \"Wednesday\";\n" +
                "    case 4:\n" +
                "      return shorten ? \"Thur\" : \"Thursday\";\n" +
                "    case 5:\n" +
                "      return shorten ? \"Fri\" : \"Friday\";\n" +
                "    case 6:\n" +
                "      return shorten ? \"Sat\" : \"Saturday\";\n" +
                "    case 7:\n" +
                "      return shorten ? \"Sun\" : \"Sunday\";\n" +
                "    default:\n" +
                "      return \"\";\n" +
                "  }\n" +
                "}\n" +
                "\n" +
                "String month(String val, bool shorten) {\n" +
                "  int month = int.parse(val);\n" +
                "  switch (month) {\n" +
                "    case 1:\n" +
                "      return shorten ? \"Jan\" : \"January\";\n" +
                "    case 2:\n" +
                "      return shorten ? \"Feb\" : \"February\";\n" +
                "    case 3:\n" +
                "      return shorten ? \"Mar\" : \"March\";\n" +
                "    case 4:\n" +
                "      return shorten ? \"Apr\" : \"April\";\n" +
                "    case 5:\n" +
                "      return \"May\";\n" +
                "    case 6:\n" +
                "      return shorten ? \"Jun\" : \"June\";\n" +
                "    case 7:\n" +
                "      return shorten ? \"Jul\" : \"July\";\n" +
                "    case 8:\n" +
                "      return shorten ? \"Aug\" : \"August\";\n" +
                "    case 9:\n" +
                "      return shorten ? \"Sep\" : \"September\";\n" +
                "    case 10:\n" +
                "      return shorten ? \"Oct\" : \"October\";\n" +
                "    case 11:\n" +
                "      return shorten ? \"Nov\" : \"November\";\n" +
                "    default:\n" +
                "      return shorten ? \"Dec\" : \"December\";\n" +
                "  }\n" +
                "}\n" +
                "\n" +
                "String day(String val) {\n" +
                "  int day = int.parse(val);\n" +
                "  int remainder = day % 10;\n" +
                "  switch (remainder) {\n" +
                "    case 1:\n" +
                "      return (day == 11) ? \"${day}th\" : \"${day}st\";\n" +
                "    case 2:\n" +
                "      return (day == 12) ? \"${day}th\" : \"${day}nd\";\n" +
                "    case 3:\n" +
                "      return (day == 13) ? \"${day}th\" : \"${day}rd\";\n" +
                "    default:\n" +
                "      return \"${day}th\";\n" +
                "  }\n" +
                "}\n" +
                "\n" +
                "String formatDateRawWithTime(DateTime date, {bool shorten = false}) =>\n" +
                "    \"${formatDate(DateFormat(\"dd/MM/yyy\").format(date), shorten: shorten)}: ${convertTime(date)}\";\n" +
                "\n" +
                "String formatDateRaw(DateTime date, {bool shorten = false}) =>\n" +
                "    formatDate(DateFormat(\"dd/MM/yyy\").format(date), shorten: shorten);\n" +
                "\n" +
                "String formatDuration(int total) {\n" +
                "  int hr = total ~/ 3600;\n" +
                "  int min = total ~/ 60;\n" +
                "  int secs = total - ((hr * 3600) - (min * 60));\n" +
                "  return \"${hr < 10 ? \"0\" : \"\"}$hr:${min < 10 ? \"0\" : \"\"}$min:${secs < 10 ? \"0\" : \"\"}$secs\";\n" +
                "}\n" +
                "\n" +
                "String convertTime(DateTime date) {\n" +
                "  bool isPM = date.hour > 11;\n" +
                "  int hours = date.hour;\n" +
                "  int minutes = date.minute;\n" +
                "  return \"${hours == 0 ? \"\" : hours % 12 < 10 ? \"0\" : \"\"}${hours == 0 || hours % 12 == 0 ? \"12\" : hours % 12}:${minutes < 10 ? \"0\" : \"\"}$minutes ${isPM ? \"PM\" : \"AM\"}\";\n" +
                "}\n" +
                "\n" +
                "class DateUtilities {\n" +
                "  static DateTime getDaysAgo(int day) {\n" +
                "    return DateTime.now().subtract(Duration(days: day));\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getDaysAhead(int day) {\n" +
                "    return DateTime.now().add(Duration(days: day));\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getMinutesBefore(int minutes) {\n" +
                "    return DateTime.now().subtract(Duration(minutes: minutes));\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getCurrentWeekStart() {\n" +
                "    return DateTime.now().startOfWeek;\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getCurrentWeekEnd() {\n" +
                "    return DateTime.now().endOfWeek;\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getLastWeekStart() {\n" +
                "    return DateTime.now().subtract(const Duration(days: 7)).startOfWeek;\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getLastWeekEnd() {\n" +
                "    return DateTime.now().subtract(const Duration(days: 7)).endOfWeek;\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getCurrentMonthStart() {\n" +
                "    return DateTime(DateTime.now().year, DateTime.now().month, 1);\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getCurrentMonthEnd() {\n" +
                "    return DateTime(DateTime.now().year, DateTime.now().month + 1, 0);\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getLastMonthStart() {\n" +
                "    return DateTime.now().subtract(const Duration(days: 30)).startOfMonth;\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getLastMonthEnd() {\n" +
                "    return DateTime.now().subtract(const Duration(days: 30)).endOfMonth;\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getPreviousMonthStart() {\n" +
                "    return DateTime.now().subtract(const Duration(days: 30)).startOfMonth;\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getPreviousMonthEnd() {\n" +
                "    return DateTime.now().subtract(const Duration(days: 30)).endOfMonth;\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getYearsAhead(int years) {\n" +
                "    return DateTime.now().add(Duration(days: 365 * years));\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getThreeMonthsAgoStart() {\n" +
                "    return DateTime.now().subtract(const Duration(days: 90));\n" +
                "  }\n" +
                "\n" +
                "  static DateTime getThreeMonthsAgoEnd() {\n" +
                "    return DateTime.now().subtract(const Duration(days: 90)).endOfMonth;\n" +
                "  }\n" +
                "}";

        Path filePath = Paths.get(path.toString(), "date.dart");
        Files.writeString(Files.createFile(filePath), content);
    }

    private static void createFocusFunctions(Path path) throws IOException {
        String content = """
                import 'package:flutter/widgets.dart';

                void unFocus() => FocusManager.instance.primaryFocus?.unfocus();""";

        Path filePath = Paths.get(path.toString(), "string.dart");
        Files.writeString(Files.createFile(filePath), content);
    }

    private static void createNumberFunctions(Path path) throws IOException {
        String content = """
                String formatRawAmount(int price) => formatAmount(price.toString());

                String formatAmount(String price) {
                  String priceInText = "";
                  int counter = 0;
                  for (int i = (price.length - 1); i >= 0; i--) {
                    counter++;
                    String str = price[i];
                    if ((counter % 3) != 0 && i != 0) {
                      priceInText = "$str$priceInText";
                    } else if (i == 0) {
                      priceInText = "$str$priceInText";
                    } else {
                      priceInText = ",$str$priceInText";
                    }
                  }
                  return priceInText.trim();
                }""";

        Path filePath = Paths.get(path.toString(), "number.dart");
        Files.writeString(Files.createFile(filePath), content);
    }

    private static void createValidationFunctions(Path path) throws IOException {
        String content = """
                import 'package:flutter/material.dart';

                bool validateAndSaveForm(GlobalKey<FormState> formKey) {
                  FormState? currentState = formKey.currentState;
                  if (currentState != null) {
                    if (!currentState.validate()) return false;

                    currentState.save();
                    return true;
                  }
                  return false;
                }
                """;

        Path filePath = Paths.get(path.toString(), "validation.dart");
        Files.writeString(Files.createFile(filePath), content);
    }

    private static void createExportFile(Path path) throws IOException {
        String content =
                """
                        export 'date.dart';
                        export 'focus.dart';
                        export 'number.dart';
                        export 'validation.dart';""";

        Path filePath = Paths.get(path.toString(), "functions.dart");
        Files.writeString(Files.createFile(filePath), content);
    }
}
