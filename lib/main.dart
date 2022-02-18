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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _showDialog(),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '通过弹窗退出应用程序',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Future<bool> _showDialog() async {
    bool suc = await showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text('你确定要退出吗？'), actions: <Widget>[
              RaisedButton(
                  child: Text('退出'),
                  onPressed: () => Navigator.of(context).pop(true)),
              RaisedButton(
                  child: Text('取消'),
                  onPressed: () => Navigator.of(context).pop(false)),
            ]));
    return suc;
  }
}
