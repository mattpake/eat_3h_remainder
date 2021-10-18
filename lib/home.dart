import 'package:clay_containers/widgets/clay_container.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:eat_3h_remainder/main.dart';
import 'package:flutter/material.dart';

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
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: _white,
      ),
      backgroundColor: _white,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: Center(
                  child: Image.asset(
                    "images/hungry.png",
                    width: 250,
                    height: 180,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 300),
                child: InkWell(
                  onTap: () {
                    NotificationApi.showNotification(
                      title: 'Notification',
                      body: 'This gona work.',
                      payload: 'payload',
                    );
                  },
                  child: ClayContainer(
                    width: 350,
                    height: 40,
                    borderRadius: 7,
                    surfaceColor: _white,
                    child: Center(
                      child: ClayText(
                        "Simple notification",
                        emboss: true,
                        color: _white,
                        parentColor: _white,
                        depth: 100,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
