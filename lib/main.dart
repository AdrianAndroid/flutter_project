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
  int columns = 4;

  List<String> list = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blueAccent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      columns = 2;
                    });
                  },
                  child: Text('2')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      columns = 3;
                    });
                  },
                  child: Text('3')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      columns = 4;
                    });
                  },
                  child: Text('4')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      columns = 5;
                    });
                  },
                  child: Text('5')),
            ],
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              int groupCount = (list.length / columns).ceil();
              var w = _getImgWidth(columns);
              // 生成几行
              return Column(
                children: List.generate(
                  groupCount,
                  (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        columns,
                        (index) => _getItem(width: w, height: w),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  _getImgWidth(int col) {
    double w = 0;
    switch (col) {
      case 2:
        w = 169;
        break;
      case 3:
        w = 109;
        break;
      case 4:
        w = 79;
        break;
      case 5:
        w = 61;
        break;
      default:
        w = 61;
        break;
    }
    return w;
  }

  Widget _getItem({
    String title = '',
    double width = 100,
    double height = 100,
  }) =>
      Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(title),
      );
}
