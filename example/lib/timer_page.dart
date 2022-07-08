import 'package:flutter/material.dart';
import 'package:flutter_dmcb_core/flutter_dmcb_core.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final timer = DTimerCountdown(mDuration: const Duration(seconds: 1).inMilliseconds, mTotalTime: 15 * 60 * 1000);
  var _countDownStr = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('开始倒计时:$_countDownStr'),
            onTap: () {
              if (timer.isActive) {
                return;
              }
              timer.setTotalTime(20 * 60 * 30 * 1000);
              timer.setOnTimerCountdownCallback((millisUntilFinished) {
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
                  ).format(pattern: 'hh:mm:ss');
                });
              });
              timer.startCountDown();
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
