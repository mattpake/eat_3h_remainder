import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  // var android = const AndroidInitializationSettings('app_icon');

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        icon: "@mipmap/ic_launcher",
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future init({bool initScheduled = false}) async {
    tz.initializeTimeZones();

    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);

    await _notifications.initialize(
      settings,
      onSelectNotification: (payload) async {
        onNotifications.add(payload);
      },
    );

    // if (initScheduled) {
      // final locationName = await FlutterNativeTimeZone.getLocalTimezone(
      //   tz.setLocalLocation(tz.getLocation(locationName),),
      // );
    // }
  }

  static Future showNotification({
    int id = 1,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);

  static void showScheduleNotification({
    int? id ,
    String? title,
    String? body,
    String? payload,
    Time? time,
    required DateTime scheduleDate,
  }) async =>
      _notifications.zonedSchedule(
        id!,
        title,
        body,
        _scheduleDaily(time!),
        await _notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );

  static tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
   print(now);
    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(Duration(days: 1))
        : scheduleDate;
  }

//   static tz.TZDateTime _scheduleWeekly(Time time, {required List<int> days}) {
//     tz.TZDateTime scheduleDate = _scheduleDaily(time);
//
//     while (!days.contains(scheduleDate.weekday)) {
//       scheduleDate = scheduleDate.add(Duration(days: 1));
//     }
//     return scheduleDate;
//   }
}
