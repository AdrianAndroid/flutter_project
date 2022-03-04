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
        body: Container(child: MainRoute()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainState();
}

class _MainState extends State<MainRoute> {
  // 定义一个状态， 保存当前指针位置
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Listener(
          child: Container(
            width: 300.0,
            height: 300.0,
            color: Colors.blue,
            child: Center(child: Text('底部')),
          ),
          onPointerDown: (event) => print('down0'),
        ),
        Listener(
          child: Container(
            color: Colors.grey,
            width: 100.0,
            height: 100.0,
            child: Center(child: Text('外部')),
          ),
          onPointerDown: (event) => print('down1'),
          behavior: HitTestBehavior.translucent,
        ),
      ],
    );
  }
}

// 创造机会，了解你的过程，传递你的信息。分享自己
//
