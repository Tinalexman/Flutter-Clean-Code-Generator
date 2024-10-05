import writers.core.controller.NotificationControllerWriter;
import writers.core.database.DatabaseHandlerWriter;
import writers.features.RouteWriter;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Main {


    public static void main(String[] args) throws Exception {

        Display.displayIntroMessage();

        Display.displayMessage("The following dependencies would be used during generation. You can delete any unnecessary dependency generated. \n" + Dependencies.getAllDependencies());

        String[] features = getFeatureInformation();

        String currentDirectory = getCurrentDirectory();
        Path targetDirectory = getTargetDirectory(currentDirectory);

        String projectName = getProjectName();

        createCoreFolders(targetDirectory, projectName);
        createFeaturesFolders(targetDirectory, features, projectName);
    }

    private static String getCurrentDirectory() {
        return "C:\\Users\\USER\\Desktop\\teste";
//        return System.getProperty("user.dir");
    }

    private static Path getTargetDirectory(String currentDirectory) {
        return Paths.get(currentDirectory, "lib");
    }

    private static String getProjectName() {
        Display.displayInputMessage("What is the name of your project");
        return Input.readLine();
    }

    private static String[] getFeatureInformation() {
        Display.displayInputMessage("List all the features, separated by spaces, that your project contains");
        String allFeatures = Input.readLine();
        return allFeatures.split(" ");
    }

    private static void createCoreFolders(Path targetDirectory, String projectName) throws Exception {
        String targetPath = targetDirectory.toString();

        Path coreFolderPath = Paths.get(targetPath, "core");
        Files.createDirectories(coreFolderPath);

        Path controllerPath = createCoreSubDirectoryPath(targetPath, "controllers");
        NotificationControllerWriter.createControllerFile(controllerPath, projectName);

        Path databasePath = createCoreSubDirectoryPath(targetPath, "database");
        DatabaseHandlerWriter.createHandlerFile(databasePath);


//        Path errorPath = createCoreSubDirectoryPath(targetPath, "error");
//        Path extensionsPath = createCoreSubDirectoryPath(targetPath, "extensions");
//        Path filePath = createCoreSubDirectoryPath(targetPath, "file");
//        Path functionsPath = createCoreSubDirectoryPath(targetPath, "functions");
//        Path navigationPath = createCoreSubDirectoryPath(targetPath, "navigation");
//        Path networkPath = createCoreSubDirectoryPath(targetPath, "network");
//        Path providerPath = createCoreSubDirectoryPath(targetPath, "provider");
//        Path uiPath = createCoreSubDirectoryPath(targetPath, "ui");



    }

    private static Path createCoreSubDirectoryPath(String targetPath, String name) throws Exception {
        Path path = Paths.get(targetPath, "core", name);
        return Files.createDirectories(path);
    }

    private static void createFeaturesFolders(Path targetDirectory, String[] features, String projectName) throws Exception {
        String targetPath = targetDirectory.toString();

        Path featureFolderPath = Paths.get(targetPath, "features");
        Files.createDirectories(featureFolderPath);

        for(String feature : features) {
            Path featurePath = Paths.get(targetPath, "features", feature);
            Files.createDirectories(featurePath);
            String featureStringPath = featurePath.toString();

            createDataFeatures(featureStringPath);
            createDomainFeatures(featureStringPath);
            createPresentationFeatures(featureStringPath);

            RouteWriter.createRouteFile(featureStringPath, feature, projectName);
        }
    }



    private static void createDataFeatures(String targetPath) throws IOException{
        Path dataPath = Paths.get(targetPath, "data");
        Files.createDirectories(dataPath);

        Path datasourcesPath = Paths.get(targetPath, "data", "datasources");
        Files.createDirectories(datasourcesPath);

        Path modelsPath = Paths.get(targetPath, "data", "models");
        Files.createDirectories(modelsPath);

        Path reportsPath = Paths.get(targetPath, "data", "repositories");
        Files.createDirectories(reportsPath);
    }

    private static void createDomainFeatures(String targetPath) throws IOException {
        Path domainPath = Paths.get(targetPath, "domain");
        Files.createDirectories(domainPath);

        Path entitiesPath = Paths.get(targetPath, "domain", "entities");
        Files.createDirectories(entitiesPath);

        Path useCasePath = Paths.get(targetPath, "domain", "usecases");
        Files.createDirectories(useCasePath);

        Path reportsPath = Paths.get(targetPath, "domain", "repositories");
        Files.createDirectories(reportsPath);
    }

    private static void createPresentationFeatures(String targetPath) throws IOException {
        Path presentationPath = Paths.get(targetPath, "presentation");
        Files.createDirectories(presentationPath);

        Path pagesPath = Paths.get(targetPath, "presentation", "pages");
        Files.createDirectories(pagesPath);

        Path providersPath = Paths.get(targetPath, "presentation", "providers");
        Files.createDirectories(providersPath);

        Path widgetsPath = Paths.get(targetPath, "presentation", "widgets");
        Files.createDirectories(widgetsPath);
    }


}