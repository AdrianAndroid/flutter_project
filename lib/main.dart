import 'package:flutter/material.dart';

// 在Flutter中创建有意思的滚动效果 - Sliver系列
// https://www.jianshu.com/p/5aeeb7ea776b

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(title: Text('PositionedDirectional')),
        body: Center(
          child: Container(
            color: Colors.blue,
            width: 200,
            height: 200,
            child: PositionedDirectionalPage(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PositionedDirectionalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedDirectionalPageState();
}

class PositionedDirectionalPageState extends State<PositionedDirectionalPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 提供top/bottom/start/end 四种定位属性
        PositionedDirectional(
          start: 10,
          end: 10,
          top: 10,
          bottom: 10,
          child: Container(color: Colors.red),
        ),
      ],
    );
  }
}
