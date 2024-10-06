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