import 'package:clay_containers/widgets/clay_container.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:eat_3h_remainder/models.dart';
import 'package:eat_3h_remainder/preferences_service.dart';
import 'package:eat_3h_remainder/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'hexcolor.dart';
import 'notification_api.dart';

class Remainder extends StatefulWidget {
  const Remainder({Key? key}) : super(key: key);

  @override
  _RemainderState createState() => _RemainderState();
}

class _RemainderState extends State<Remainder> {
  final _preferencesService = PreferencesService();

  TimeOfDay selectedTimeFirstNotification = TimeOfDay.now();
  TimeOfDay selectedTimeSecondNotification = TimeOfDay.now();
  TimeOfDay selectedTimeThirdNotification = TimeOfDay.now();

  final Color _white = const Color(0xFFF2F2F2);
  final Color _blue = HexColor("279AF1");
  final Color _yellow = HexColor("EAB464");
  final Color _black = HexColor("322E18");
  final Color _green = HexColor("7AE582");

  final _firstNotificationTitleController = TextEditingController();
  final _firstNotificationBodyController = TextEditingController();
  final _firstNotificationDescriptionController = TextEditingController();
  var _firstNotificationHour;
  var _firstNotificationMinute;

  final _secondNotificationTitleController = TextEditingController();
  final _secondNotificationBodyController = TextEditingController();
  final _secondNotificationDescriptionController = TextEditingController();
  var _secondNotificationHour;
  var _secondNotificationMinute;

  final _thirdNotificationTitleController = TextEditingController();
  final _thirdNotificationBodyController = TextEditingController();
  final _thirdNotificationDescriptionController = TextEditingController();
  var _thirdNotificationHour;
  var _thirdNotificationMinute;

  void _populateFields() async {
    final firstSettings = await _preferencesService.getFirstSettings();
    final secondSettings = await _preferencesService.getSecondSettings();
    final thirdSettings = await _preferencesService.getThirdSettings();

    setState(() {
      _firstNotificationTitleController.text = firstSettings.title;
      _firstNotificationBodyController.text = firstSettings.description;
      _firstNotificationDescriptionController.text = firstSettings.payload;
      _firstNotificationHour = firstSettings.hour;
      _firstNotificationMinute = firstSettings.minute;
      selectedTimeFirstNotification = firstSettings.time;

      _secondNotificationTitleController.text = secondSettings.title;
      _secondNotificationBodyController.text = secondSettings.description;
      _secondNotificationDescriptionController.text = secondSettings.payload;
      _secondNotificationHour = secondSettings.hour;
      _secondNotificationMinute = secondSettings.minute;
      selectedTimeSecondNotification = secondSettings.time;

      _thirdNotificationTitleController.text = thirdSettings.title;
      _thirdNotificationBodyController.text = thirdSettings.description;
      _thirdNotificationDescriptionController.text = thirdSettings.payload;
      _thirdNotificationHour = thirdSettings.hour;
      _thirdNotificationMinute = thirdSettings.minute;
      selectedTimeThirdNotification = thirdSettings.time;
    });
  }

  @override
  void initState() {
    _populateFields();
    super.initState();

    void listenNotifications() =>
        NotificationApi.onNotifications.stream.listen(onClickedNotification);

    NotificationApi.init(initScheduled: true);
    listenNotifications();
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SecondPage(payload: payload),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClayText(
          "Remainder",
          emboss: true,
          color: _white,
          parentColor: _white,
          textColor: _blue,
          depth: 100,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: _white,
      ),
      backgroundColor: _white,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: const BorderSide(color: Colors.white)),
                    child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: const Color(0x802196F3),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  ' Breakfast ',
                                  style: TextStyle(
                                    backgroundColor: _black,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: TextFormField(
                                controller: _firstNotificationTitleController,
                                decoration: const InputDecoration(
                                  labelText: "Title",
                                  fillColor: Colors.white,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Title cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: TextFormField(
                                controller: _firstNotificationBodyController,
                                decoration: const InputDecoration(
                                  labelText: "Body",
                                  fillColor: Colors.white,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Body cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: TextFormField(
                                // keyboardType: TextInputType.number,
                                controller:
                                    _firstNotificationDescriptionController,
                                decoration: const InputDecoration(
                                  labelText: "Description",
                                  fillColor: Colors.white,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Description cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 12, top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      // _firstNotificationHour = selectedTime.hour;
                                      _selectTimeFirstNotification(context);
                                      // print("selected time: ${selectedTime.format()}");
                                    },
                                    child: Text(
                                      "${selectedTimeFirstNotification.hour.toString().padLeft(2, '0')}:${selectedTimeFirstNotification.minute.toString().padLeft(2, '0')}",
                                      style: const TextStyle(fontSize: 33),
                                    ),
                                  ),
                                  // Text(
                                  //     "${selectedTime.hour}:${selectedTime.minute}"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 12, top: 0, bottom: 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      _savedSettingsFirstNotification();
                                      NotificationApi.showScheduleNotification(
                                        id: 1,
                                        title: _firstNotificationTitleController
                                            .text,
                                        body: _firstNotificationBodyController
                                            .text,
                                        payload:
                                            _firstNotificationDescriptionController
                                                .text,
                                        time: Time(
                                            selectedTimeFirstNotification.hour,
                                            selectedTimeFirstNotification
                                                .minute,
                                            0),
                                        scheduleDate: DateTime.now(),
                                      );
                                      _titleAndBodyIsEmpty(
                                          _firstNotificationTitleController
                                              .text,
                                          _firstNotificationBodyController
                                              .text);
                                    },
                                    child: const Text(
                                      'Schedule Notification',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: const BorderSide(color: Colors.white)),
                    child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: const Color(0x802196F3),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  ' Morning Snack ',
                                  style: TextStyle(
                                    backgroundColor: _black,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: TextFormField(
                                controller: _secondNotificationTitleController,
                                decoration: const InputDecoration(
                                  labelText: "Title",
                                  fillColor: Colors.white,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Title cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: TextFormField(
                                controller: _secondNotificationBodyController,
                                decoration: const InputDecoration(
                                  labelText: "Body",
                                  fillColor: Colors.white,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Body cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: TextFormField(
                                // keyboardType: TextInputType.number,
                                controller:
                                    _secondNotificationDescriptionController,
                                decoration: const InputDecoration(
                                  labelText: "Description",
                                  fillColor: Colors.white,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Description cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 12, top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      // _firstNotificationHour = selectedTime.hour;
                                      _selectTimeSecondNotification(context);
                                      // print("selected time: ${selectedTime.format()}");
                                    },
                                    child: Text(
                                      "${selectedTimeSecondNotification.hour.toString().padLeft(2, '0')}:${selectedTimeSecondNotification.minute.toString().padLeft(2, '0')}",
                                      style: const TextStyle(fontSize: 33),
                                    ),
                                  ),
                                  // Text(
                                  //     "${selectedTime.hour}:${selectedTime.minute}"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 12, top: 0, bottom: 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      _savedSettingsSecondNotification();
                                      NotificationApi.showScheduleNotification(
                                        id: 1,
                                        title:
                                            _secondNotificationTitleController
                                                .text,
                                        body: _secondNotificationBodyController
                                            .text,
                                        payload:
                                            _secondNotificationDescriptionController
                                                .text,
                                        time: Time(
                                            selectedTimeSecondNotification.hour,
                                            selectedTimeSecondNotification
                                                .minute,
                                            0),
                                        scheduleDate: DateTime.now(),
                                      );
                                      _titleAndBodyIsEmpty(
                                          _secondNotificationTitleController
                                              .text,
                                          _secondNotificationBodyController
                                              .text);
                                    },
                                    child: const Text(
                                      'Schedule Notification',
                                    ),
                                  ),
                                  // Text(
                                  //     "${selectedTime.hour}:${selectedTime.minute}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: const BorderSide(color: Colors.white)),
                    child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: const Color(0x802196F3),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  ' Lunch ',
                                  style: TextStyle(
                                    backgroundColor: _black,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: TextFormField(
                                controller: _thirdNotificationTitleController,
                                decoration: const InputDecoration(
                                  labelText: "Title",
                                  fillColor: Colors.white,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Title cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: TextFormField(
                                controller: _thirdNotificationBodyController,
                                decoration: const InputDecoration(
                                  labelText: "Body",
                                  fillColor: Colors.white,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Body cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: TextFormField(
                                // keyboardType: TextInputType.number,
                                controller:
                                    _thirdNotificationDescriptionController,
                                decoration: const InputDecoration(
                                  labelText: "Description",
                                  fillColor: Colors.white,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Description cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 12, top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      // _firstNotificationHour = selectedTime.hour;
                                      _selectTimeThirdNotification(context);
                                      // print("selected time: ${selectedTime.format()}");
                                    },
                                    child: Text(
                                      "${selectedTimeThirdNotification.hour.toString().padLeft(2, '0')}:${selectedTimeThirdNotification.minute.toString().padLeft(2, '0')}",
                                      style: const TextStyle(fontSize: 33),
                                    ),
                                  ),
                                  // Text(
                                  //     "${selectedTime.hour}:${selectedTime.minute}"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 12, top: 0, bottom: 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      _savedSettingsThirdNotification();
                                      NotificationApi.showScheduleNotification(
                                        id: 1,
                                        title: _thirdNotificationTitleController
                                            .text,
                                        body: _thirdNotificationBodyController
                                            .text,
                                        payload:
                                            _thirdNotificationDescriptionController
                                                .text,
                                        time: Time(
                                            selectedTimeThirdNotification.hour,
                                            selectedTimeThirdNotification
                                                .minute,
                                            0),
                                        scheduleDate: DateTime.now(),
                                      );
                                      _titleAndBodyIsEmpty(
                                          _thirdNotificationTitleController
                                              .text,
                                          _thirdNotificationBodyController
                                              .text);
                                    },
                                    child: const Text(
                                      'Schedule Notification',
                                    ),
                                  ),
                                  // Text(
                                  //     "${selectedTime.hour}:${selectedTime.minute}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectTimeFirstNotification(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTimeFirstNotification,
      initialEntryMode: TimePickerEntryMode.dial,
      confirmText: "CONFIRM",
      cancelText: "NOT NOW",
      helpText: "",
    );
    if (timeOfDay != null && timeOfDay != selectedTimeFirstNotification) {
      setState(
        () {
          selectedTimeFirstNotification = timeOfDay;
          _firstNotificationHour = selectedTimeFirstNotification.hour;
          _firstNotificationMinute = selectedTimeFirstNotification.minute;
        },
      );
    }
  }

  _selectTimeSecondNotification(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTimeSecondNotification,
      initialEntryMode: TimePickerEntryMode.dial,
      confirmText: "CONFIRM",
      cancelText: "NOT NOW",
      helpText: "",
    );
    if (timeOfDay != null && timeOfDay != selectedTimeSecondNotification) {
      setState(
        () {
          selectedTimeSecondNotification = timeOfDay;
          _secondNotificationHour = selectedTimeSecondNotification.hour;
          _secondNotificationMinute = selectedTimeSecondNotification.minute;
        },
      );
    }
  }

  _selectTimeThirdNotification(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTimeThirdNotification,
      initialEntryMode: TimePickerEntryMode.dial,
      confirmText: "CONFIRM",
      cancelText: "NOT NOW",
      helpText: "",
    );
    if (timeOfDay != null && timeOfDay != selectedTimeThirdNotification) {
      setState(
        () {
          selectedTimeThirdNotification = timeOfDay;
          _thirdNotificationHour = selectedTimeThirdNotification.hour;
          _thirdNotificationMinute = selectedTimeThirdNotification.minute;
        },
      );
    }
  }

  void _savedSettingsFirstNotification() {
    final newSettingsFirstNotification = SettingsNotification(
        _firstNotificationTitleController.text,
        _firstNotificationBodyController.text,
        _firstNotificationDescriptionController.text,
        _firstNotificationHour,
        _firstNotificationMinute,
        selectedTimeFirstNotification);

    _preferencesService.saveFirstSettings(newSettingsFirstNotification);
  }

  void _savedSettingsSecondNotification() {
    final newSettingsSecondNotification = SettingsNotification(
        _secondNotificationTitleController.text,
        _secondNotificationBodyController.text,
        _secondNotificationDescriptionController.text,
        _secondNotificationHour,
        _secondNotificationMinute,
        selectedTimeSecondNotification);

    _preferencesService.saveSecondSettings(newSettingsSecondNotification);
  }

  void _savedSettingsThirdNotification() {
    final newSettingsSecondNotification = SettingsNotification(
        _thirdNotificationTitleController.text,
        _thirdNotificationBodyController.text,
        _thirdNotificationDescriptionController.text,
        _thirdNotificationHour,
        _thirdNotificationMinute,
        selectedTimeThirdNotification);

    _preferencesService.saveThirdSettings(newSettingsSecondNotification);
  }

  _titleAndBodyIsEmpty(String title, String body) {
    if (title.isEmpty && body.isEmpty) {
      final snackBar = SnackBar(
        content: const Text(
          'Notification could not be scheduled without Title or Body.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: _yellow,
      );
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        content: const Text(
          'Notification scheduled.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: _green,
      );
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
