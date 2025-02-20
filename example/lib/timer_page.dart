import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dmcb_core/flutter_dmcb_core.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final timer = DTimerCountdown();
  var _countDownStr = '';

  final timer1 = DTimerCountdown();
  var _countDownStr1 = '';

  final timer2 = DTimerCountdown();
  var _countDownStr2 = '';

  final timer3 = DTimerCounter(interval: 1000);
  var _counterStr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('HH:mm:ss点击开始倒计时: $_countDownStr'),
            onTap: () {
              if (timer.isActive) {
                return;
              }
              timer.setTotalTimeWithSecond(120);
              timer.setOnTimerCountdownCallback((millisUntilFinished) {
                if (mounted) {
                  setState(() {
                    _countDownStr = DTimerFormat.hourMinuteSecond.format(millisUntilFinished);
                  });
                }
              });
              timer.startCountDown();
            },
          ),
          const Divider(),
          ListTile(
            title: Text('mm:ss点击开始倒计时: $_countDownStr1'),
            onTap: () {
              if (timer1.isActive) {
                return;
              }
              timer1.setTotalTimeWithSecond(11 * 60);
              timer1.setOnTimerCountdownCallback((millisUntilFinished) {
                if (mounted) {
                  setState(() {
                    _countDownStr1 = DTimerFormat.minuteSecond.format(millisUntilFinished);
                  });
                }
              });
              timer1.startCountDown();
            },
          ),
          const Divider(),
          ListTile(
            title: Text('ss点击开始倒计时: $_countDownStr2'),
            onTap: () {
              const d = Duration(hours: 1, seconds: 60);
              if (kDebugMode) {
                print(d.inMilliseconds);
                print(d.inSeconds);
              }
              if (timer2.isActive) {
                return;
              }
              timer2.setTotalTimeWithSecond(120);
              timer2.setOnTimerCountdownCallback((millisUntilFinished) {
                if (mounted) {
                  setState(() {
                    _countDownStr2 = DTimerFormat.second.format(millisUntilFinished);
                  });
                }
              });
              timer2.startCountDown();
            },
          ),
          const Divider(),
          ListTile(
            title: Text('mm:ss点击计时: $_counterStr'),
            onTap: () {
              if (timer3.isActive) {
                return;
              }
              timer3.setOnTimerCounterCallback((millisUntilFinished) {
                if (mounted) {
                  setState(() {
                    _counterStr = DTimerFormat.hourMinuteSecond.formatWithSeconds(millisUntilFinished);
                  });
                }
              });
              timer3.startCounter();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    timer1.cancel();
    timer2.cancel();
    timer3.cancel();
    super.dispose();
  }
}
