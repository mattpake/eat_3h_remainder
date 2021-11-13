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

  TimeOfDay selectedTime = TimeOfDay.now();

  final Color _white = const Color(0xFFF2F2F2);
  final Color _blue = HexColor("279AF1");
  final Color _yellow = HexColor("EAB464");

  final _firstNotificationTitleController = TextEditingController();
  final _firstNotificationBodyController = TextEditingController();
  final _firstNotificationDescriptionController = TextEditingController();
  var _firstNotificationHour;
  var _firstNotificationMinute;

  void _populateFields() async {
    final settings = await _preferencesService.getFirstSettings();
    setState(() {
      _firstNotificationTitleController.text = settings.title;
      _firstNotificationBodyController.text = settings.description;
      _firstNotificationDescriptionController.text = settings.payload;
      _firstNotificationHour = settings.hour;
      _firstNotificationMinute = settings.minute;
      selectedTime = settings.time;
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

    NotificationApi.showScheduleNotification(
      id: 0,
      title: 'Time to Eat',
      body: "It's time for breakfast.",
      payload: "It's time for breakfast",
      time: const Time(7, 0, 0),
      scheduleDate: DateTime.now(),
    );

    // NotificationApi.showScheduleNotification(
    //   id: 1,
    //   title: 'Time to Eat',
    //   body: "It's time for snack and protein.",
    //   payload: 'You can grab some protein bar, or shake with soy bobs.',
    //   time: const Time(10, 0, 0),
    //   scheduleDate: DateTime.now(),
    // );

    NotificationApi.showScheduleNotification(
      id: 2,
      title: 'Time to Eat',
      body: "It's time for lunch.",
      payload: "It's time for lunch.",
      time: const Time(12, 0, 0),
      scheduleDate: DateTime.now(),
    );

    NotificationApi.showScheduleNotification(
      id: 3,
      title: 'Time to Eat',
      body: "It's time for snack and protein.",
      payload:
          "Depend when you plan go to gym you can have protein shake and some snack.",
      time: const Time(14, 0, 0),
      scheduleDate: DateTime.now(),
    );

    NotificationApi.showScheduleNotification(
      id: 4,
      title: 'Time to Eat',
      body: "It's time for post workout meal.",
      payload: "It's time for post workout meal.",
      time: const Time(17, 0, 0),
      scheduleDate: DateTime.now(),
    );

    NotificationApi.showScheduleNotification(
      id: 5,
      title: 'Time to Eat',
      body: "It's time for dinner.",
      payload: "If you don't feel hunger micellar protein with bobs will do.",
      time: const Time(20, 0, 0),
      scheduleDate: DateTime.now(),
    );
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
                          const Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'First Notification',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 12),
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
                            padding: const EdgeInsets.only(left: 20, right: 12),
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
                            padding: const EdgeInsets.only(left: 20, right: 12),
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
                                    _selectTime(context);
                                    // print("selected time: ${selectedTime.format()}");
                                  },
                                  child: Text(
                                    "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}",
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
                                      body:
                                          _firstNotificationBodyController.text,
                                      payload:
                                          _firstNotificationDescriptionController
                                              .text,
                                      time: Time(selectedTime.hour,
                                          selectedTime.minute, 0),
                                      scheduleDate: DateTime.now(),
                                    );
                                    _titleAndBodyIsEmpty(
                                        _firstNotificationTitleController.text,
                                        _firstNotificationBodyController.text);
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
              // Padding(
              //   padding: EdgeInsets.only(top: 3),
              //   child: InkWell(
              //     onTap: () {
              //       NotificationApi.showScheduleNotification(
              //         title: 'Scheduled Notification',
              //         body: 'This gonna work.',
              //         payload: 'payload message',
              //         scheduleDate: DateTime.now().add(
              //           const Duration(seconds: 12),
              //         ),
              //       );
              //       const snackBar = SnackBar(
              //         content: Text(
              //           'Scheduled in 12 Seconds.',
              //           style: TextStyle(fontSize: 24),
              //         ),
              //         backgroundColor: Colors.yellow,
              //       );
              //       ScaffoldMessenger.of(context)
              //         ..removeCurrentSnackBar()
              //         ..showSnackBar(snackBar);
              //     },
              //     child: ClayContainer(
              //       width: 350,
              //       height: 40,
              //       borderRadius: 7,
              //       surfaceColor: _white,
              //       child: Center(
              //         child: ClayText(
              //           "Scheduled notification",
              //           emboss: true,
              //           color: _white,
              //           parentColor: _white,
              //           depth: 100,
              //           style: const TextStyle(fontSize: 17),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
      confirmText: "CONFIRM",
      cancelText: "NOT NOW",
      helpText: "",
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(
        () {
          selectedTime = timeOfDay;
          _firstNotificationHour = selectedTime.hour;
          _firstNotificationMinute = selectedTime.minute;
        },
      );
    }
  }

  _titleAndBodyIsEmpty(String title, String body) {
    if (title.isEmpty && body.isEmpty) {
      final snackBar = SnackBar(
        content: const Text(
          'Notification could not be scheduled without Title or Body.',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: _yellow,
      );
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  void _savedSettingsFirstNotification() {
    final newSettingsFirstNotification = SettingsFirstNotification(
        _firstNotificationTitleController.text,
        _firstNotificationBodyController.text,
        _firstNotificationDescriptionController.text,
        _firstNotificationHour,
        _firstNotificationMinute,
        selectedTime);

    print(newSettingsFirstNotification);
    _preferencesService.saveFirstSettings(newSettingsFirstNotification);

    print('Time hour: $_firstNotificationHour');
  }
}
