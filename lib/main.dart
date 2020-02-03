import 'dart:async';

import 'package:flutter/material.dart';

import 'CustomTextContainer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTIck() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTIck();
      });
    }

    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

    return MaterialApp(
      title: 'Timer',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomTextContainer(
                    label: 'HRS',
                    value: hours.toString().padLeft(2, '0'),
                  ),
                  CustomTextContainer(
                    label: 'MIN',
                    value: minutes.toString().padLeft(2, '0'),
                  ),
                  CustomTextContainer(
                    label: 'SEC',
                    value: seconds.toString().padLeft(2, '0'),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text(isActive ? 'STOP' : 'START'),
                  onPressed: () {
                    setState(
                      () {
                        isActive = !isActive;
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
