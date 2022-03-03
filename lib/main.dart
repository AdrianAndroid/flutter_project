import 'dart:core';

import 'package:flutter/material.dart';

// 在Flutter中创建有意思的滚动效果 - Sliver系列
// https://www.jianshu.com/p/5aeeb7ea776b

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

List<String> _getDataList() {
  List<String> list = [];
  for (int i = 0; i < 100; i++) {
    list.add(i.toString());
  }
  return list;
}

Widget _getItemContainer(String item) {
  //return _buildCircleAvatar(item);
  return _buildRoundContainer(item);
}

_buildRoundContainer(String item) => Container(
      // width: 100,
      height: 200,
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Column(
        children: [
          Image(image: AssetImage('assets/shop2.png')),
          Center(
            child: Text(
              item,
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );

_buildRoundContainer2(String item) => Container(
      // width: 100,
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Column(
        children: [
          Image(image: AssetImage('assets/shop2.png')),
          Center(
            child: Text(
              item,
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );

class _MyAppState extends State<MyApp> {
  Widget? _mywidget;

  void initState() {
    super.initState();
    _mywidget = _GridView1();
  }

  SelectView(String text, String id) {
    return PopupMenuItem(
      value: id,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.message, color: Colors.blue),
          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
          actions: [
            // 非隐藏的菜单
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_alarm),
            ),
            // 隐藏的菜单
            PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                SelectView('_gridView1', '_gridView1'),
                SelectView('_GridView2', '_GridView2'),
                SelectView('_GridView3', '_GridView3'),
                SelectView('_GridView4', '_GridView4'),
              ],
              onSelected: (String action) {
                switch (action) {
                  case '_gridView1':
                    setState(() {
                      _mywidget = _GridView1();
                    });
                    break;
                  case '_GridView2':
                    setState(() {
                      _mywidget = _GridView2();
                    });
                    break;
                  case '_GridView3':
                    setState(() {
                      _mywidget = _GridView3();
                    });
                    break;
                  case '_GridView4':
                    setState(() {
                      _mywidget = _GridView4();
                    });
                    break;
                }
              },
            ),
          ],
        ),
        body: Container(
          child: _mywidget ?? Container(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _GridView4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> datas = _getDataList();
    return GridView.custom(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 20.0,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => _getItemContainer(datas[index]),
      ),
    );
  }
}

class _GridView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> datas = _getDataList();
    return GridView.builder(
      itemCount: datas.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // 单个子Widget的水平最大宽度
        maxCrossAxisExtent: 200,
        // 水平单个子Widget之间间距
        mainAxisSpacing: 20.0,
        // 垂直单个子Widget之间间距
        crossAxisSpacing: 10.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _getItemContainer(datas[index]);
      },
    );
  }
}

class _GridView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> datas = _getDataList();
    return GridView.builder(
      itemCount: datas.length,
      // SliverGridDelegateWithFixedCrossAxisCount构建一个横轴数量Widget
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // 横轴元素个数
        crossAxisCount: 3,
        // 纵轴间距
        mainAxisSpacing: 20.0,
        // 横轴间距
        crossAxisSpacing: 10.0,
        // 子组件宽高长度比例
        // childAspectRatio: 1.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _getItemContainer(datas[index]);
      },
    );
  }
}

class _GridView1 extends StatelessWidget {
  List<Widget> _getWidgetList() {
    return _getDataList().map((e) => _getItemContainer(e)).toList();
  }

  Widget _gridView1() {
    return GridView.count(
      // 水平子Widget之间间距
      crossAxisSpacing: 10.0,
      // 垂直子Widget之间间距
      mainAxisSpacing: 10.0,
      // GridView内边距
      padding: EdgeInsets.all(10.0),
      // 一行的Widget数量
      crossAxisCount: 3,
      // 子Widget宽高比例
      // childAspectRatio: 1.0,
      // 子Widget列表
      children: _getWidgetList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _gridView1();
  }
}
