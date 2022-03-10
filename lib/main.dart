import 'dart:async';

import 'package:flutter/material.dart';

// Flutter: 倒计时组件
// https://blog.csdn.net/BunnyCoffer/article/details/119955233

void main() {
  runApp(MyApp());
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
        appBar: AppBar(title: Text('AppBar')),
        body: CountDownWidget(),
      ),
    );
  }
}

class CountDownWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountDowWidgetState();
}

// 懂得细心的观察，喜好
// 提供情绪价值
class _CountDowWidgetState extends State<CountDownWidget> {
  bool refresh = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              refresh = !refresh;
            });
          },
          child: Text('开始计时'),
        ),
        refresh
            ? DownTimeText(time: 500, textStyle: TextStyle())
            : DownTimeText(time: 500, textStyle: TextStyle())
      ],
    );
  }
}

// 时间倒计时
class DownTimeText extends StatefulWidget {
  final int time;
  final TextStyle textStyle;

  const DownTimeText({
    Key? key,
    required this.time,
    required this.textStyle,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DownTimeTextState();
}

class _DownTimeTextState extends State<DownTimeText> {
  late int _time;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _time = widget.time;
    startDownTimer();
  }

  // 倒计时
  void startDownTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_time == null || _time == 0) {
        setState(() {});
        timer.cancel();
      }
      _time--;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '倒计时:$_time',
      style: widget.textStyle,
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
