import 'dart:async';

import 'package:example/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dmcb_core/flutter_dmcb_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 1;
  var _countDownStr = '00:14:00';

  final timer = DTimer(mInterval: const Duration(seconds: 1).inMilliseconds);
  void _incrementCounter() {
    final t = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (DUtils.isDebug) {
        print(timer.tick);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      if (timer.isActive()) return;
                      timer.setInterval(const Duration(seconds: 1).inMilliseconds);
                      _counter = 1;
                      timer.setOnTimerTickCallback((millisUntilFinished) {
                        setState(() {
                          _counter += 1;
                        });
                      });
                      timer.startTimer();
                    },
                    child: const Text('开始')),
                TextButton(
                    onPressed: () {
                      if (timer.isActive()) return;
                      timer.setInterval(const Duration(milliseconds: 1).inMilliseconds);
                      timer.setTotalTime(const Duration(seconds: 100).inMilliseconds);
                      timer.setOnTimerTickCallback((millisUntilFinished) {
                        setState(() {
                          final duration = Duration(milliseconds: millisUntilFinished);
                          _countDownStr = DateTime(
                            2000,
                            1,
                            1,
                            duration.inHours % 24,
                            duration.inMinutes % 60,
                            duration.inSeconds % 60,
                            duration.inMilliseconds % 1000,
                          ).format(pattern: 'HH:mm:ss.S');
                        });
                      });
                      timer.startCountDown();
                    },
                    child: const Text('倒计时')),
                TextButton(
                    onPressed: () {
                      timer.cancel();
                    },
                    child: const Text('取消')),
              ],
            ),
            Column(
              children: [
                Text(
                  '$_counter',
                  style: TextStyle(color: '#ff0000'.toColor()),
                ),
                Text(
                  _countDownStr,
                  style: TextStyle(color: '#ff0000'.toColor()),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
