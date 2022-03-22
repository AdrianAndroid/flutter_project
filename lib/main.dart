import 'package:flutter/material.dart';

/// Visibility 隐藏/可见， 能保存组件的状态：Offstate不能保存组件的状态，组件重新加载控制child是否显示
/// 当offstage为true，控件隐藏；当offstage为false， 显示；
/// 当Offstage不可见的时候，如果child又动画等，需要手动停掉，Offstage并不会停掉动画等操作
/// const Offstage({Key key, this.offstage = true, Widget child})

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
      home: OffstageDemo(),
    );
  }
}

class OffstageDemo extends StatefulWidget {
  @override
  State<OffstageDemo> createState() => _OffstageDemoState();
}

class _OffstageDemoState extends State<OffstageDemo> {
  String showText = 'hide';
  bool isOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppBar')),
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Center(
          child: Column(
            children: [
              Text('--------'),
              Offstage(
                offstage: isOff,
                child: Text('Offstage组件'),
              ),
              Text('--------'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onButtonClickListener,
        child: Text(showText),
      ),
    );
  }

  void onButtonClickListener() {
    setState(() {
      isOff = !isOff;
    });
    if (isOff) {
      showText = 'show';
    } else {
      showText = 'hide';
    }
  }
}
