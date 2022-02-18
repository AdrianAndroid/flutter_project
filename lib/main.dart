import 'package:flutter/material.dart';

// Flutter实战*第二版
// https://www.woolha.com/tutorials/flutter-using-futurebuilder-widget-examples
// https://zhuanlan.zhihu.com/p/140235529

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        body: WillPopScopeTestRoute(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime? _lastPressedAt; //上次点击时候

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '1秒内连续按两次返回键退出',
          style: TextStyle(color: Colors.black),
        ),
      ),
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 1)) {
          // 两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          print('1秒内失误点击！！！');
          return false;
        }
        return true;
      },
    );
  }
}
