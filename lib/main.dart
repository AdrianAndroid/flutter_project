import 'dart:async';

import 'package:flutter/material.dart';

// Flutter: 倒计时组件
// https://blog.csdn.net/BunnyCoffer/article/details/119955233

void main() {
  runApp(MyApp());
}

class Utils {
// 时间格式化，根据总秒数转换为对应的hh:mm:ss格式
  static String constructTime(int seconds) {
    int day = seconds ~/ 3600 ~/ 24;
    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;

    if (day != 0) {
      return '$day天$hour小时$minute分$second秒后自动取消';
    } else if (hour != 0) {
      return '$hour小时$minute分$second秒后自动取消';
    } else if (minute != 0) {
      return '$minute分$second秒后自动取消';
    } else if (second != 0) {
      return '$second秒后自动取消';
    } else {
      return '';
    }
    //    return formatTime(day)+'天'+formatTime(hour) + "小时" + formatTime(minute) + "分" + formatTime(second)+'秒后自动取消';
  }

  static String constructVipTime(int seconds) {
    int day = seconds ~/ 3600 ~/ 24;
    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    if (day != 0) {
      return '剩$day天$hour小时$minute分';
    } else if (hour != 0) {
      return '剩$hour小时$minute分';
    } else if (minute != 0) {
      return '剩$minute分';
    } else {
      return '';
    }
//    return formatTime(day)+'天'+formatTime(hour) + "小时" + formatTime(minute) + "分" + formatTime(second)+'秒后自动取消';
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
        body: OrderPage(),
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  String countContent = ''; // 倒计时内容
  Timer? _timer;
  int seconds = 5000;

  @override
  Widget build(BuildContext context) {
    return Text('$countContent');
  }

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
      // 更新界面
      setState(() {
        // 秒数减一， 因为一秒回调一次
        seconds--;
        countContent = Utils.constructTime(seconds);
      });
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
