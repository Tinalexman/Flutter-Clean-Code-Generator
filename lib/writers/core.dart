import 'package:flutter_clean_code/file_helpers.dart';
import 'package:flutter_clean_code/res/resources.dart';

Future<void> createCore(
    String targetDirectory, String projectName, Function stateCallback) async {
  await createDirectory("$targetDirectory\\core");
  stateCallback("Creating Core Folder");

  await createDirectory("$targetDirectory\\core\\controllers");
  await writeToFile("$targetDirectory\\core\\controllers\\notification.dart",
      notificationControllerContent(projectName));
  stateCallback("Creating Notification Controller");

  await createDirectory("$targetDirectory\\core\\database");
  await writeToFile(
      "$targetDirectory\\core\\database\\handler.dart", databaseHandlerContent);
  stateCallback("Creating Database Handler");

  await createDirectory("$targetDirectory\\core\\error");
  await writeToFile(
      "$targetDirectory\\core\\error\\error.dart", errorClass(projectName));
  await writeToFile(
      "$targetDirectory\\core\\error\\handler.dart", errorHandler(projectName));
  await writeToFile("$targetDirectory\\core\\error\\errors.dart", errorExport);
  stateCallback("Creating Error & Handler");

  await createDirectory("$targetDirectory\\core\\extensions");
  await writeToFile("$targetDirectory\\core\\extensions\\build_context.dart",
      contextExtension);
  await writeToFile(
      "$targetDirectory\\core\\extensions\\string.dart", stringExtension);
  await writeToFile(
      "$targetDirectory\\core\\extensions\\date_time.dart", dateTimeExtension);
  await writeToFile(
      "$targetDirectory\\core\\extensions\\extensions.dart", extensionExport);
  stateCallback("Creating Extensions");

  await createDirectory("$targetDirectory\\core\\file");
  await writeToFile(
      "$targetDirectory\\core\\file\\handler.dart", fileUtilities);
  stateCallback("Creating File Utilities");

  await createDirectory("$targetDirectory\\core\\functions");
  await writeToFile("$targetDirectory\\core\\functions\\date_time.dart",
      dateTimeFunctions(projectName));
  await writeToFile(
      "$targetDirectory\\core\\functions\\number.dart", numberFunctions);
  await writeToFile(
      "$targetDirectory\\core\\functions\\functions.dart", functionExport);
  stateCallback("Creating Functions");

  await createDirectory("$targetDirectory\\core\\navigation");
  await writeToFile(
      "$targetDirectory\\core\\navigation\\pages.dart", navigationPages);
  stateCallback("Creating Navigation Pages");

  await createDirectory("$targetDirectory\\core\\network");
  await writeToFile("$targetDirectory\\core\\network\\configuration.dart",
      networkConfigurations);
  stateCallback("Creating Network Configurations");

  await createDirectory("$targetDirectory\\core\\provider");
  await writeToFile(
      "$targetDirectory\\core\\provider\\global.dart", globalProviders);
  stateCallback("Creating Global Providers");

  await createDirectory("$targetDirectory\\core\\ui");
  await writeToFile("$targetDirectory\\core\\ui\\colors.dart", colorsContent);
  await writeToFile("$targetDirectory\\core\\ui\\themes.dart", themeContent);
  await writeToFile("$targetDirectory\\core\\ui\\ui.dart", uiExport);
  stateCallback("Creating Colors and Themes");
}
