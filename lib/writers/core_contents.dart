

String notificationControllerContent(String projectName) => """
import 'package:$projectName/main.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationController {
                  
   @pragma("vm:entry-point")
   static Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
     
   }
   
   @pragma("vm:entry-point")
   static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
     
   }
   
   @pragma("vm:entry-point")
   static Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    
   }
   
   @pragma("vm:entry-point")
   static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    
   }

}
""";

String get databaseHandlerContent => """
import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHandler {
  static Future<void> init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Isar isar = await Isar.open(
      [],
      directory: dir.path,
    );
    GetIt.I.registerSingleton<Isar>(isar);
  }

  static Future<void> clearDatabase() async {
    Isar isar = GetIt.I.get();
    isar.clear();
  }
}
""";