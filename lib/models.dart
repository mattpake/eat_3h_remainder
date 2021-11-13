import 'package:flutter/material.dart';

class SettingsFirstNotification {
  final String title;
  final String description;
  final String payload;
  final int hour;
  final int minute;
  final TimeOfDay time;

  SettingsFirstNotification(
      this.title, this.description, this.payload, this.hour, this.minute, this.time); // TimeOfDay time;
}
