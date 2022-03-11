import 'dart:async';

import 'package:flutter/material.dart';

// Flutter: 倒计时组件
// https://blog.csdn.net/BunnyCoffer/article/details/119955233

void main() {
  runApp(MyApp());
}

class CountTime {
  final String hour;
  final String minute;
  final String seconds;

  CountTime({this.hour = '00', this.minute = '00', this.seconds = '00'});
}

class Utils {
  // 时间格式化，根据总秒数转换为对应的hh:mm:ss格式
  static CountTime constructTime2HMS(int seconds) {
    // int day = seconds ~/ 3600 ~/ 24;
    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    return CountTime(
        hour: formatTime(hour),
        minute: formatTime(minute),
        seconds: formatTime(second));
  }

  //数字格式化，将 0~9 的时间转换为 00~09
  static String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('带时间格式的倒计时')),
        body: CountDownWidget(
          endCallback: () {
            print('endCallback!!!');
          },
        ),
      ),
    );
  }
}

class CountDownWidget extends StatefulWidget {
  final VoidCallback? endCallback;

  const CountDownWidget({Key? key, this.endCallback}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  CountTime? countTime; // 倒计时内容
  Timer? _timer;
  int seconds = 10;
  TextStyle style = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return countTime != null ? _styleOne() : Container();
  }

  _styleOne() => Row(
        children: [
          Container(
            color: Color(0xFF242833),
            alignment: Alignment.center,
            width: 24,
            height: 24,
            child: Text(countTime!.hour, style: style),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Text(':'),
          ),
          Container(
            color: Color(0xFF242833),
            alignment: Alignment.center,
            width: 24,
            height: 24,
            child: Text(countTime!.minute, style: style),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Text(':'),
          ),
          Container(
            color: Color(0xFF242833),
            alignment: Alignment.center,
            width: 24,
            height: 24,
            child: Text(countTime!.seconds, style: style),
          ),
        ],
      );

  void cancelTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  void startTimer() {
    // 设置1秒回调一次
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      if (seconds < 0) {
        cancelTimer();
        widget.endCallback?.call();
      } else {
        // 更新界面
        setState(() {
          // 秒数减一， 因为一秒回调一次
          countTime = Utils.constructTime2HMS(seconds--);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
  }
}
