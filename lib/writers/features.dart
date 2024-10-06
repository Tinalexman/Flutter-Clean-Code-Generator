import 'package:flutter_clean_code/file_helpers.dart';
import 'package:flutter_clean_code/res/features/splash.dart';
import 'package:flutter_clean_code/res/resources.dart';

Future<void> createFeatures(
  String targetDirectory,
  String projectName,
  List<String> features,
  Function stateCallback,
) async {
  await createDirectory("$targetDirectory\\features");
  stateCallback("Creating Feature Folder");

  await _createSplashFeature(targetDirectory, projectName, stateCallback);

  for (String feature in features) {
    await createDirectory("$targetDirectory\\features\\$feature");
    stateCallback("Creating new feature '$feature'");

    await _createDataFeatures(targetDirectory, feature, stateCallback);
    await _createDomainFeatures(targetDirectory, feature, stateCallback);
    await _createPresentationFeatures(targetDirectory, feature, stateCallback);
    await _createRoute(targetDirectory, feature, projectName, stateCallback);
  }
}

Future<void> _createDataFeatures(
  String targetDirectory,
  String feature,
  Function stateCallback,
) async {
  await createDirectory("$targetDirectory\\features\\$feature\\data");
  stateCallback("Creating data folder for $feature");

  await createDirectory(
      "$targetDirectory\\features\\$feature\\data\\datasources");
  stateCallback("Creating data sources");

  await createDirectory("$targetDirectory\\features\\$feature\\data\\models");
  stateCallback("Creating models");

  await createDirectory(
      "$targetDirectory\\features\\$feature\\data\\repositories");
  stateCallback("Creating repositories");
}

Future<void> _createDomainFeatures(
  String targetDirectory,
  String feature,
  Function stateCallback,
) async {
  await createDirectory("$targetDirectory\\features\\$feature\\domain");
  stateCallback("Creating domain folder for $feature");

  await createDirectory(
      "$targetDirectory\\features\\$feature\\domain\\entities");
  stateCallback("Creating entities");

  await createDirectory(
      "$targetDirectory\\features\\$feature\\domain\\usecases");
  stateCallback("Creating use cases");

  await createDirectory(
      "$targetDirectory\\features\\$feature\\domain\\repositories");
  stateCallback("Creating repositories");
}

Future<void> _createPresentationFeatures(
  String targetDirectory,
  String feature,
  Function stateCallback,
) async {
  await createDirectory("$targetDirectory\\features\\$feature\\presentation");
  stateCallback("Creating presentation folder for $feature");

  await createDirectory(
      "$targetDirectory\\features\\$feature\\presentation\\pages");
  stateCallback("Creating pages");

  await createDirectory(
      "$targetDirectory\\features\\$feature\\presentation\\providers");
  stateCallback("Creating providers");

  await createDirectory(
      "$targetDirectory\\features\\$feature\\presentation\\widgets");
  stateCallback("Creating widgets");
}

Future<void> _createRoute(
  String targetDirectory,
  String feature,
  String projectName,
  Function stateCallback,
) async {
  await writeToFile(
      "$targetDirectory\\features\\$feature\\presentation\\routes.dart",
      routeContent(projectName, feature));
  stateCallback("Creating routes for $feature");
}

Future<void> _createSplashRoute(
  String targetDirectory,
  String projectName,
  Function stateCallback,
) async {
  await writeToFile(
      "$targetDirectory\\features\\splash\\presentation\\routes.dart",
      splashRouteContent(projectName));
  stateCallback("Creating routes for splash");
}

Future<void> _createSplashFeature(
  String targetDirectory,
  String projectName,
  Function stateCallback,
) async {
  await createDirectory("$targetDirectory\\features\\splash");
  stateCallback("Creating new feature 'splash'");

  await _createDataFeatures(targetDirectory, "splash", stateCallback);
  await _createDomainFeatures(targetDirectory, "splash", stateCallback);
  await _createPresentationFeatures(targetDirectory, "splash", stateCallback);
  await writeToFile(
      "$targetDirectory\\features\\splash\\presentation\\pages\\splash.dart",
      splashContent);
  await _createSplashRoute(targetDirectory, projectName, stateCallback);
}
