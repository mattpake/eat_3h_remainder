import 'package:clay_containers/widgets/clay_container.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:eat_3h_remainder/main.dart';
import 'package:eat_3h_remainder/second_page.dart';
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
  final Color _white = const Color(0xFFF2F2F2);
  final Color _blue = HexColor("279AF1");

  @override
  void initState() {
    super.initState();

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

    NotificationApi.showScheduleNotification(
      id: 1,
      title: 'Time to Eat',
      body: "It's time for snack and protein.",
      payload: 'You can grab some protein bar, or shake with soy bobs.',
      time: const Time(10, 0, 0),
      scheduleDate: DateTime.now(),
    );

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
                              decoration: const InputDecoration(
                                labelText: "Title",
                                fillColor: Colors.white,
                              ),
                              validator: (val) {
                                debugPrint(val);
                                if (val!.isEmpty) {
                                  return "Email cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 12),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Description",
                                fillColor: Colors.white,
                              ),
                              onChanged: (String? value) {
                                print(value);
                              },
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Email cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 12),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Payload",
                                fillColor: Colors.white,
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Email cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 12),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Time",
                                fillColor: Colors.white,
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Email cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
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
}
