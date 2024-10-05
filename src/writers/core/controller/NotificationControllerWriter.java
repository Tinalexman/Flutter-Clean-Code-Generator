package writers.core.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


public class NotificationControllerWriter {


    private static String getProjectImports(String projectName) {
        return "import 'package:" + projectName + "/main.dart';\n";
    }

    public static void createControllerFile(Path path, String projectName) throws IOException {

        String content = """
                import 'package:awesome_notifications/awesome_notifications.dart';
                import 'package:flutter/material.dart';
                 \s
                 \s
                class NotificationController {
                  \s
                   @pragma("vm:entry-point")
                   static Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
                     \s
                   }
                  \s
                  \s
                   @pragma("vm:entry-point")
                   static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
                     \s
                   }
                  \s
                  \s
                   @pragma("vm:entry-point")
                   static Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
                    \s
                   }
                  \s
                  \s
                   @pragma("vm:entry-point")
                   static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
                    \s
                   }
                   \s
                }
                \s""";


        Path filePath = Paths.get(path.toString(), "notification.dart");
        Files.writeString(Files.createFile(filePath), getProjectImports(projectName) + content);
    }
}
