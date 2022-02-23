import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(title: Text('CupertinoSegmentedControl')),
        body: MyHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// MyHomePage
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// MyHomePageState
class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          buildSegment(),
          _buildTab(),
        ],
      ),
    );
  }

  buildSegment() {
    return CupertinoSegmentedControl(
      // 子标签
      children: <int, Widget>{
        0: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text("全部"),
        ),
        1: Text("收入"),
        2: Text("支出"),
      },
      // 当前选中的索引
      groupValue: _currentIndex,
      // 点击回调
      onValueChanged: (int index) {
        print('当前选中 $index');
        setState(() {
          _currentIndex = index;
        });
      },
      // 选中的背景颜色
      selectedColor: Colors.blue,
      // 未选中的背景颜色
      unselectedColor: Colors.white,
      // 边框颜色
      borderColor: Colors.blue,
      // 按下的颜色
      pressedColor: Colors.blue.withOpacity(0.4),
    );
  }

  _buildTab() {
    if (_currentIndex == 0) {
      return TabOne();
    } else if (_currentIndex == 1) {
      return TabTwo();
    } else {
      return TabThree();
    }
  }
}

class TabOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text('TabOne'),
      ),
    );
  }
}

class TabTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Expanded(
        child: Text('TabTwo'),
      ),
    );
  }
}

class TabThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('TabThree'),
      ),
    );
  }
}
