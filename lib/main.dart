import 'package:eat_3h_remainder/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  // var initializationSettingsIOS = IOSInitializationSettings(
  //     requestAlertPermission: false,
  //     requestBadgePermission: false,
  //     requestSoundPermission: false,
  //     onDidReceiveLocalNotification: (
  //       int id,
  //       String? title,
  //       String? body,
  //       String? payload,
  //     ) async {});
  //
  // var initializationSettings = InitializationSettings(android: initializationSettingsAndroid,iOS: initializationSettingsIOS);
  runApp(
    new MaterialApp(
      home: Remainder(),
    ),
  );
}
