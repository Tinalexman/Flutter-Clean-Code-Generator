import writers.core.controller.NotificationControllerWriter;
import writers.core.database.DatabaseHandlerWriter;
import writers.core.error.ErrorWriter;
import writers.core.extensions.ExtensionWriters;
import writers.core.file.FileWriters;
import writers.core.functions.FunctionWriters;
import writers.core.navigation.NavigationWriters;
import writers.core.network.NetworkWriters;
import writers.core.providers.ProviderWriters;
import writers.core.ui.UIWriters;
import writers.features.RouteWriter;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Main {


    public static void main(String[] args) throws Exception {

        Display.displayIntroMessage();

        String projectName = getProjectName();
        String[] features = getFeatureInformation();

        Display.displayMessage("The following dependencies would be used during generation. \n" + Dependencies.getAllDependencies());

        String currentDirectory = getCurrentDirectory();
        Path targetDirectory = getTargetDirectory(currentDirectory);

        createCoreFolders(targetDirectory, projectName);
        createFeaturesFolders(targetDirectory, features, projectName);

        Display.displayOutroMessage();
    }

    private static String getCurrentDirectory() {
        return System.getProperty("user.dir");
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
        Display.displayMessage("Creating Core Folder");

        Path controllerPath = createCoreSubDirectoryPath(targetPath, "controllers");
        NotificationControllerWriter.createControllerFile(controllerPath, projectName);
        Display.displayMessage("Creating Controllers");

        Path databasePath = createCoreSubDirectoryPath(targetPath, "database");
        DatabaseHandlerWriter.createHandlerFile(databasePath);
        Display.displayMessage("Creating Database Configurations");

        Path errorPath = createCoreSubDirectoryPath(targetPath, "error");
        ErrorWriter.createErrorFiles(errorPath, projectName);
        Display.displayMessage("Creating Errors and Handlers");

        Path extensionsPath = createCoreSubDirectoryPath(targetPath, "extensions");
        ExtensionWriters.createExtensionFiles(extensionsPath);
        Display.displayMessage("Creating Extensions");

        Path filePath = createCoreSubDirectoryPath(targetPath, "file");
        FileWriters.createFile(filePath);
        Display.displayMessage("Creating File Utilities");

        Path functionsPath = createCoreSubDirectoryPath(targetPath, "functions");
        FunctionWriters.createFunctions(functionsPath, projectName);
        Display.displayMessage("Creating Functions");

        Path navigationPath = createCoreSubDirectoryPath(targetPath, "navigation");
        NavigationWriters.createNavigationPages(navigationPath);
        Display.displayMessage("Creating Navigation Pages");

        Path networkPath = createCoreSubDirectoryPath(targetPath, "network");
        NetworkWriters.createNetworkConfiguration(networkPath);
        Display.displayMessage("Creating Network Configurations");

        Path providerPath = createCoreSubDirectoryPath(targetPath, "provider");
        ProviderWriters.createProviders(providerPath);
        Display.displayMessage("Creating Global Providers");

        Path uiPath = createCoreSubDirectoryPath(targetPath, "ui");
        UIWriters.createColorsAndThemes(uiPath);
        Display.displayMessage("Creating Colors and Themes");
    }

    private static Path createCoreSubDirectoryPath(String targetPath, String name) throws Exception {
        Display.displayMessage("Creating '" + name + "' folder in Core");
        Path path = Paths.get(targetPath, "core", name);
        return Files.createDirectories(path);
    }

    private static void createFeaturesFolders(Path targetDirectory, String[] features, String projectName) throws Exception {
        System.out.println();
        System.out.println();
        Display.displayMessage("Creating Features Folder");

        String targetPath = targetDirectory.toString();

        Path featureFolderPath = Paths.get(targetPath, "features");
        Files.createDirectories(featureFolderPath);

        for(String feature : features) {
            Path featurePath = Paths.get(targetPath, "features", feature);
            Files.createDirectories(featurePath);
            Display.displayMessage("Creating feature '" + feature + "' folder in Features");
            String featureStringPath = featurePath.toString();

            createDataFeatures(featureStringPath, feature);
            createDomainFeatures(featureStringPath, feature);
            createPresentationFeatures(featureStringPath, feature);

            RouteWriter.createRouteFile(featureStringPath, feature, projectName);
            Display.displayMessage("Creating routes for " + feature);
            Display.displayMessage("");
        }
    }

    private static void createDataFeatures(String targetPath, String feature) throws IOException{
        Path dataPath = Paths.get(targetPath, "data");
        Files.createDirectories(dataPath);
        Display.displayMessage("Creating data folder for " + feature);

        Path datasourcesPath = Paths.get(targetPath, "data", "datasources");
        Files.createDirectories(datasourcesPath);
        Display.displayMessage("Creating data sources");

        Path modelsPath = Paths.get(targetPath, "data", "models");
        Files.createDirectories(modelsPath);
        Display.displayMessage("Creating models");

        Path reportsPath = Paths.get(targetPath, "data", "repositories");
        Files.createDirectories(reportsPath);
        Display.displayMessage("Creating repositories");
    }

    private static void createDomainFeatures(String targetPath, String feature) throws IOException {
        Path domainPath = Paths.get(targetPath, "domain");
        Files.createDirectories(domainPath);
        Display.displayMessage("Creating domain folder for " + feature);

        Path entitiesPath = Paths.get(targetPath, "domain", "entities");
        Files.createDirectories(entitiesPath);
        Display.displayMessage("Creating entities");

        Path useCasePath = Paths.get(targetPath, "domain", "usecases");
        Files.createDirectories(useCasePath);
        Display.displayMessage("Creating usecases");

        Path reportsPath = Paths.get(targetPath, "domain", "repositories");
        Files.createDirectories(reportsPath);
        Display.displayMessage("Creating repositories");
    }

    private static void createPresentationFeatures(String targetPath, String feature) throws IOException {
        Path presentationPath = Paths.get(targetPath, "presentation");
        Files.createDirectories(presentationPath);
        Display.displayMessage("Creating presentation folder for " + feature);

        Path pagesPath = Paths.get(targetPath, "presentation", "pages");
        Files.createDirectories(pagesPath);
        Display.displayMessage("Creating pages");

        Path providersPath = Paths.get(targetPath, "presentation", "providers");
        Files.createDirectories(providersPath);
        Display.displayMessage("Creating providers");

        Path widgetsPath = Paths.get(targetPath, "presentation", "widgets");
        Files.createDirectories(widgetsPath);
        Display.displayMessage("Creating widgets");
    }


}