import 'package:flutter/material.dart';

// Flutter实战*第二版
// https://www.woolha.com/tutorials/flutter-using-futurebuilder-widget-examples
// https://zhuanlan.zhihu.com/p/140235529
// -->WillPopScope用于处理是否离开当前页面，在Flutter中有多种方式可以离开当前页面，
// 比如AppBar、CupertinoNavigationBar上面的返回按钮，点击将会回到前一个页面，
// 在Android手机上点击实体（虚拟）返回按钮，也将会回到前一个页面，此功能对于iOS程序员来说
// 可能特别容易忽略。
// -->以下集中情况我们会用到WillPopScope
// 1. 需要询问用户是否退出。
// 2. App中有多个Navigator，想要的是让其中一个 Navigator 退出，而不是直接让在 Widget tree
// 底层的 Navigator退出。

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
