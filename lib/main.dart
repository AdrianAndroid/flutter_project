import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/banner.dart';

//https://www.wanandroid.com/banner/json

//https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png
//https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png
//https://www.wanandroid.com/blogimgs/ab17e8f9-6b79-450b-8079-0f2287eb6f0f.png
//https://www.wanandroid.com/blogimgs/fb0ea461-e00a-482b-814f-4faca5761427.png
//https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png
//https://www.wanandroid.com/blogimgs/00f83f1d-3c50-439f-b705-54a49fc3d90d.jpg

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banner',
      home: Scaffold(
        appBar: AppBar(title: Text('Banner')),
        body: Container(child: Test()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TestState();
}

class TestState extends State<Test> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text('A')),
            // 垂直方向拖动事件
            onVerticalDragUpdate: (DragUpdateDetails details) {
              debugPrint('onVerticalDragUpdate dx=${details.delta.dx} '
                  'dy=${details.delta.dy}');
              setState(() {
                _top += details.delta.dy;
              });
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              debugPrint('onHorizontalDragUpdate dx=${details.delta.dx} '
                  'dy=${details.delta.dy}');
              setState(() {
                _left += details.delta.dx;
              });
            },
          ),
        ),
      ],
    );
  }
}
