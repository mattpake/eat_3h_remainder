import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';

class PreferencesService {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  Future saveFirstSettings(SettingsNotification settings) async {
    final preferences = await SharedPreferences.getInstance();
   await preferences.clear();

    await preferences.setString('firstNotificationTitle', settings.title);
    await preferences.setString(
        'firstNotificationDescription', settings.description);
    await preferences.setString('firstNotificationPayload', settings.payload);
    await preferences.setInt('firstNotificationHour', settings.hour);
    await preferences.setInt('firstNotificationMinute', settings.minute);
  }

  Future saveSecondSettings(SettingsNotification settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('secondNotificationTitle', settings.title);
    await preferences.setString(
        'secondNotificationDescription', settings.description);
    await preferences.setString('secondNotificationPayload', settings.payload);
    await preferences.setInt('secondNotificationHour', settings.hour);
    await preferences.setInt('secondNotificationMinute', settings.minute);
  }

  Future saveThirdSettings(SettingsNotification settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('thirdNotificationTitle', settings.title);
    await preferences.setString(
        'thirdNotificationDescription', settings.description);
    await preferences.setString('thirdNotificationPayload', settings.payload);
    await preferences.setInt('thirdNotificationHour', settings.hour);
    await preferences.setInt('thirdNotificationMinute', settings.minute);
  }

  Future saveFourthSettings(SettingsNotification settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('fourthNotificationTitle', settings.title);
    await preferences.setString(
        'fourthNotificationDescription', settings.description);
    await preferences.setString('fourthNotificationPayload', settings.payload);
    await preferences.setInt('fourthNotificationHour', settings.hour);
    await preferences.setInt('fourthNotificationMinute', settings.minute);
  }
  Future saveFifthSettings(SettingsNotification settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('fifthNotificationTitle', settings.title);
    await preferences.setString(
        'fifthNotificationDescription', settings.description);
    await preferences.setString('fifthNotificationPayload', settings.payload);
    await preferences.setInt('fifthNotificationHour', settings.hour);
    await preferences.setInt('fifthNotificationMinute', settings.minute);
  }
  Future saveSixthSettings(SettingsNotification settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('sixthNotificationTitle', settings.title);
    await preferences.setString(
        'sixthNotificationDescription', settings.description);
    await preferences.setString('sixthNotificationPayload', settings.payload);
    await preferences.setInt('sixthNotificationHour', settings.hour);
    await preferences.setInt('sixthNotificationMinute', settings.minute);
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

  Future<SettingsNotification> getFourthSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final title = preferences.getString('fourthNotificationTitle');
    final description = preferences.getString('fourthNotificationDescription');
    final payload = preferences.getString('fourthNotificationPayload');
    final hour = preferences.getInt('fourthNotificationHour');
    final minute = preferences.getInt('fourthNotificationMinute');
    TimeOfDay time = TimeOfDay(hour: hour ?? _timeOfDay.hour, minute: minute ?? _timeOfDay.minute);

    return SettingsNotification(
        title?? '', description?? '', payload?? '', hour ?? _timeOfDay.hour, minute ?? _timeOfDay.minute, time);
  }
  Future<SettingsNotification> getFifthSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final title = preferences.getString('fifthNotificationTitle');
    final description = preferences.getString('fifthNotificationDescription');
    final payload = preferences.getString('fifthNotificationPayload');
    final hour = preferences.getInt('fifthNotificationHour');
    final minute = preferences.getInt('fifthNotificationMinute');
    TimeOfDay time = TimeOfDay(hour: hour ?? _timeOfDay.hour, minute: minute ?? _timeOfDay.minute);

    return SettingsNotification(
        title?? '', description?? '', payload?? '', hour ?? _timeOfDay.hour, minute ?? _timeOfDay.minute, time);
  }
  Future<SettingsNotification> getSixthSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final title = preferences.getString('sixthNotificationTitle');
    final description = preferences.getString('sixthNotificationDescription');
    final payload = preferences.getString('sixthNotificationPayload');
    final hour = preferences.getInt('sixthNotificationHour');
    final minute = preferences.getInt('sixthNotificationMinute');
    TimeOfDay time = TimeOfDay(hour: hour ?? _timeOfDay.hour, minute: minute ?? _timeOfDay.minute);

    return SettingsNotification(
        title?? '', description?? '', payload?? '', hour ?? _timeOfDay.hour, minute ?? _timeOfDay.minute, time);
  }
}
