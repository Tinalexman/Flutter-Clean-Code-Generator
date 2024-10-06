

import 'package:flutter_clean_code/file_helpers.dart';
import 'package:flutter_clean_code/writers/core_contents.dart';

Future<void> createCore(String targetDirectory, String projectName, Function stateCallback) async {
  await createDirectory("$targetDirectory\\core");
  stateCallback("Creating Core Folder");

  await createDirectory("$targetDirectory\\core\\controllers");
  await writeToFile("$targetDirectory\\core\\controllers\\notification.dart", notificationControllerContent(projectName));
  stateCallback("Creating Notification Controller");

  await createDirectory("$targetDirectory\\core\\database");
  await writeToFile("$targetDirectory\\core\\database\\handler.dart", databaseHandlerContent);
  stateCallback("Creating Database Handler");

  await createDirectory("$targetDirectory\\core\\error");
  await writeToFile("$targetDirectory\\core\\error\\error.dart", databaseHandlerContent);
  await writeToFile("$targetDirectory\\core\\error\\handler.dart", databaseHandlerContent);
  await writeToFile("$targetDirectory\\core\\error\\errors.dart", databaseHandlerContent);
  stateCallback("Creating Error & Handler");

  await createDirectory("$targetDirectory\\core\\extensions");
  await writeToFile("$targetDirectory\\core\\extensions\\build_context.dart", databaseHandlerContent);
  await writeToFile("$targetDirectory\\core\\extensions\\string.dart", databaseHandlerContent);
  await writeToFile("$targetDirectory\\core\\extensions\\extensions.dart", databaseHandlerContent);
  stateCallback("Creating Extensions");

  await createDirectory("$targetDirectory\\core\\file");
  await writeToFile("$targetDirectory\\core\\file\\handler.dart", databaseHandlerContent);
  stateCallback("Creating File Utilities");

  await createDirectory("$targetDirectory\\core\\functions");
  await writeToFile("$targetDirectory\\core\\functions\\date_time.dart", databaseHandlerContent);
  await writeToFile("$targetDirectory\\core\\functions\\number.dart", databaseHandlerContent);
  await writeToFile("$targetDirectory\\core\\functions\\focus.dart", databaseHandlerContent);
  await writeToFile("$targetDirectory\\core\\functions\\validation.dart", databaseHandlerContent);
  await writeToFile("$targetDirectory\\core\\functions\\functions.dart", databaseHandlerContent);
  stateCallback("Creating Functions");

  await createDirectory("$targetDirectory\\core\\navigation");
  await writeToFile("$targetDirectory\\core\\navigation\\pages.dart", databaseHandlerContent);
  stateCallback("Creating Navigation Pages");

  await createDirectory("$targetDirectory\\core\\network");
  await writeToFile("$targetDirectory\\core\\network\\configuration.dart", databaseHandlerContent);
  stateCallback("Creating Network Configurations");


  await createDirectory("$targetDirectory\\core\\provider");
  await writeToFile("$targetDirectory\\core\\provider\\global.dart", databaseHandlerContent);
  stateCallback("Creating Global Providers");

  await createDirectory("$targetDirectory\\core\\ui");
  await writeToFile("$targetDirectory\\core\\ui\\colors.dart", databaseHandlerContent);
  await writeToFile("$targetDirectory\\core\\ui\\themes.dart", databaseHandlerContent);
  await writeToFile("$targetDirectory\\core\\ui\\ui.dart", databaseHandlerContent);
  stateCallback("Creating Colors and Themes");
}