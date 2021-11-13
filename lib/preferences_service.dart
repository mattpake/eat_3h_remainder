import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';

class PreferencesService {
  Future saveFirstSettings(SettingsFirstNotification settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('firstNotificationTitle', settings.title);
    await preferences.setString(
        'firstNotificationDescription', settings.description);
    await preferences.setString('firstNotificationPayload', settings.payload);
    await preferences.setInt('firstNotificationHour', settings.hour);
    await preferences.setInt('firstNotificationMinute', settings.minute);

    print('Saved Settings');
  }

  Future<SettingsFirstNotification> getFirstSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final title = preferences.getString('firstNotificationTitle');
    final description = preferences.getString('firstNotificationDescription');
    final payload = preferences.getString('firstNotificationPayload');
    final hour = preferences.getInt('firstNotificationHour');
    final minute = preferences.getInt('firstNotificationMinute');
    TimeOfDay time = TimeOfDay(hour: hour ?? 22, minute: minute ?? 22);

    return SettingsFirstNotification(
        title!, description!, payload!, hour ?? 22, minute ?? 22, time);
  }
}
