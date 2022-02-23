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
        body: _DragVertical(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _DragVertical extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DragVerticalState();
}

class _DragVerticalState extends State<_DragVertical> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: _top,
        child: GestureDetector(
          child: CircleAvatar(child: Text("A")),
          // 垂直方向拖动事件
          onVerticalDragUpdate: (DragUpdateDetails details) {
            setState(() {
              _top += details.delta.dy;
            });
          },
        ),
      ),
    ]);
  }
}
