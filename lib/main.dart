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
      home: Scaffold(
        appBar: AppBar(title: Text('LayoutBuilder')),
        body: MyPage(),
      ),
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
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _getItem(),
              _getItem(),
              _getItem(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _getItem(),
              _getItem(),
              _getItem(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getItem() => Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      );

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
}
