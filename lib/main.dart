import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listener',
      home: Scaffold(
        appBar: AppBar(title: Text('手势检测')),
        body: MyHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// MyHomePage
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _GestureTestState();
}

class _GestureTestState extends State<MyHomePage> {
  String _operation = 'No Gesture detected!';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200.0,
          height: 100.0,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => updateText("Tap"), // 点击
        onDoubleTap: () => updateText("DoubleTap"), // 双击
        onLongPress: () => updateText("LongPress"), // 长按
      ),
    );
  } //保存事件名

  void updateText(String text) {
    // 更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
