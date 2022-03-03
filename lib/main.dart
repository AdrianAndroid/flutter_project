import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_project/staggered.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Flutter之瀑布流效果——Flutter基础系列
// https://www.jianshu.com/p/35c1aa49c32b

// StaggeredGridView.count()
// StaggeredGridView.countBuilder()
// StaggeredGridView.builder()
// StaggeredGridView.custom()
// StaggeredGridView.extent()
// StaggeredGridView.extentBuilder()

// ===================================
// ===================================
// StaggeredGridView.count():创建了一个纵轴方向固定Tile个数的布局，适合子Widget个数比较少的情况，使用List<Widget>来设置。
// StaggeredGridView.countBuilder()：和StaggeredGridView.count()差不多，区别在于适合子Widget数量比较多，需要动态创建的情况。
// StaggeredGridView.extent()：创建了一个在纵轴方法指定Tile个数的最大值的布局，适合子Widget个数比较少的情况，使用List<Widget>来设置。
// StaggeredGridView.extentBuilder()：和StaggeredGridView.extent()差不多，区别在于适合子Widget数量比较多，需要动态创建的情况。
// StaggeredGridView.builder()和StaggeredGridView.custom()更高级也更灵活。

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget? _mywidget;

  void initState() {
    super.initState();
    _mywidget = StaggeredPage();
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
                      //_mywidget = _GridView1();
                    });
                    break;
                  case '_GridView2':
                    setState(() {
                      //_mywidget = _GridView2();
                    });
                    break;
                  case '_GridView3':
                    setState(() {
                      //_mywidget = _GridView3();
                    });
                    break;
                  case '_GridView4':
                    setState(() {
                      //_mywidget = _GridView4();
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

// Widget _renderCountBuilder() {
//   return StaggeredGridView.
// }
}
