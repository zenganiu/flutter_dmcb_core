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
              timer.setTotalTime(61 * 60 * 1000);
              timer.setOnTimerCountdownCallback((millisUntilFinished) {
                if (mounted) {
                  setState(() {
                    _countDownStr = DTimerCountdownFormat.hourMinuteSecond.format(millisUntilFinished);
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
              timer1.setTotalTime(11 * 60 * 1000);
              timer1.setOnTimerCountdownCallback((millisUntilFinished) {
                if (mounted) {
                  setState(() {
                    _countDownStr1 = DTimerCountdownFormat.minuteSecond.format(millisUntilFinished);
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
              final d = Duration(hours: 1,seconds: 60);
              print(d.inMilliseconds);

              if (timer2.isActive) {
                return;
              }
              timer2.setTotalTime(120 * 1000);
              timer2.setOnTimerCountdownCallback((millisUntilFinished) {
                if (mounted) {
                  setState(() {
                    _countDownStr2 = DTimerCountdownFormat.second.format(millisUntilFinished);
                  });
                }
              });
              timer2.startCountDown();
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
    super.dispose();
  }
}
