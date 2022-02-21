import 'package:flutter/material.dart';

// https://www.jianshu.com/p/46cf3de34e72
// 找一个文档
// 通过LayoutBuilder组件可以获取父组件的约束尺寸

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPageState();
  }
}

class MyPageState extends State<MyPage> {
  double _height = 50;

  @override
  Widget build(BuildContext context) {
    print('页面重绘了.........');
    // 整个页面使用ChangeNotifier来包裹
    return Scaffold(
      appBar: AppBar(title: Text('Overlay')),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _height = 50;
                setState(() {});
              },
              child: Text('50')),
          ElevatedButton(
              onPressed: () {
                _height = 200;
                setState(() {});
              },
              child: Text('200')),
          Container(
            height: _height,
            child: _layoutbuilderWidget,
          ),
        ],
      ),
    );
  }

  Widget get _layoutbuilderWidget {
    print('_layoutbuilderWidget');
    return LayoutBuilder(
        builder: (context, constraints) {

          print('constraints height => ${constraints.maxHeight}');
          var color = Colors.red;
          if (constraints.maxHeight > 100) {
            color = Colors.blue;
          } else {
            color = Colors.red;
          }
          return Container(
            height: 50,
            width: 50,
            color: color,
          );
        },
      );
  }

  @override
  void initState() {
    super.initState();
  }
}
