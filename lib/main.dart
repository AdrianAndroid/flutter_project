import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyHome(),
    ),
  );
}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomeState();
  }
}

class _MyHomeState extends State<MyHome> {
  bool _offstage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CircularProgressIndicator')),
      body: Column(
        children: [
          SizedBox(height: 1.0),
          Center(
            child: RaisedButton(
              child: Text('button'),
              onPressed: () async {
                // 开始倒计时
                _value = 0;
                startCountdownTimer();
                // 进度指示器 loading 显示
                setState(() {
                  _offstage = false;
                });
                // 等待10秒中
                await Future.delayed(Duration(milliseconds: 10000));

                // 进度指示器 loading 隐藏
                setState(() {
                  _offstage = true;
                });
              },
            ),
          ),
          SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(),
          ),
          SizedBox(height: 50),
          Center(
            child: Offstage(
              offstage: _offstage,
              // 默认指示器
              child: CircularProgressIndicator(),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Offstage(
              offstage: _offstage,
              child: CircularProgressIndicator(),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Offstage(
              offstage: _offstage,
              // 有背景颜色， 指示器
              child: CircularProgressIndicator(
                backgroundColor: Colors.black12,
              ),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Offstage(
              offstage: _offstage,
              // 有进度值颜色 指示器
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Offstage(
              offstage: _offstage,
              // 进度值 10个宽 指示器
              child: CircularProgressIndicator(
                strokeWidth: 10,
              ),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Offstage(
              offstage: _offstage,
              // 根据 倒计时给定 进度值， 进度值在0到1之间。如果为空显示动画，非空显示进度
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange[100],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                value: _value / 190,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 倒计时
  Timer? _timer;
  double _value = 0;

  void startCountdownTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }

    // 50毫秒执行一次
    const oneSec = const Duration(milliseconds: 50);
    var callback = (timer) => {
          setState(() {
            if (_value > 200) {
              _timer?.cancel();
            } else {
              _value = _value + 1;
            }
          })
        };
    _timer = Timer.periodic(oneSec, callback);
  }
}
