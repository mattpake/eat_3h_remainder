import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';

class PreferencesService {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  Future saveFirstSettings(SettingsNotification settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('firstNotificationTitle', settings.title);
    await preferences.setString(
        'firstNotificationDescription', settings.description);
    await preferences.setString('firstNotificationPayload', settings.payload);
    await preferences.setInt('firstNotificationHour', settings.hour);
    await preferences.setInt('firstNotificationMinute', settings.minute);

    print('Saved Settings');
  }

  Future saveSecondSettings(SettingsNotification settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('secondNotificationTitle', settings.title);
    await preferences.setString(
        'secondNotificationDescription', settings.description);
    await preferences.setString('secondNotificationPayload', settings.payload);
    await preferences.setInt('secondNotificationHour', settings.hour);
    await preferences.setInt('secondNotificationMinute', settings.minute);

    print('Saved Settings');
  }

  Future saveThirdSettings(SettingsNotification settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('thirdNotificationTitle', settings.title);
    await preferences.setString(
        'thirdNotificationDescription', settings.description);
    await preferences.setString('thirdNotificationPayload', settings.payload);
    await preferences.setInt('thirdNotificationHour', settings.hour);
    await preferences.setInt('thirdNotificationMinute', settings.minute);

    print('Saved Settings');
  }

  Future<SettingsNotification> getFirstSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final title = preferences.getString('firstNotificationTitle');
    final description = preferences.getString('firstNotificationDescription');
    final payload = preferences.getString('firstNotificationPayload');
    final hour = preferences.getInt('firstNotificationHour');
    final minute = preferences.getInt('firstNotificationMinute');
    TimeOfDay time = TimeOfDay(hour: hour ?? _timeOfDay.hour, minute: minute ?? _timeOfDay.minute);

    return SettingsNotification(
        title?? '', description?? '', payload?? '', hour ?? _timeOfDay.hour, minute ?? _timeOfDay.minute, time);
  }

  Future<SettingsNotification> getSecondSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final title = preferences.getString('secondNotificationTitle');
    final description = preferences.getString('secondNotificationDescription');
    final payload = preferences.getString('secondNotificationPayload');
    final hour = preferences.getInt('secondNotificationHour');
    final minute = preferences.getInt('secondNotificationMinute');
    TimeOfDay time = TimeOfDay(hour: hour ?? _timeOfDay.hour, minute: minute ?? _timeOfDay.minute);

    return SettingsNotification(
        title?? '', description?? '', payload?? '', hour ?? _timeOfDay.hour, minute ?? _timeOfDay.minute, time);
  }

  Future<SettingsNotification> getThirdSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final title = preferences.getString('thirdNotificationTitle');
    final description = preferences.getString('thirdNotificationDescription');
    final payload = preferences.getString('thirdNotificationPayload');
    final hour = preferences.getInt('thirdNotificationHour');
    final minute = preferences.getInt('thirdNotificationMinute');
    TimeOfDay time = TimeOfDay(hour: hour ?? _timeOfDay.hour, minute: minute ?? _timeOfDay.minute);

    return SettingsNotification(
        title?? '', description?? '', payload?? '', hour ?? _timeOfDay.hour, minute ?? _timeOfDay.minute, time);
  }
}
