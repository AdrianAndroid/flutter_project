import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_project/dotted_border.dart';

// 看这个资料
// Flutter各种虚线实战和虚线边框原理
// https://blog.csdn.net/ZZB_Bin/article/details/112907929

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    // _mywidget = _GridItem2();
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
                SelectView('_GridItem2', '_GridItem2'),
                SelectView('_GridItem3', '_GridItem3'),
                SelectView('_GridItem4', '_GridItem4'),
                SelectView('_GridItem5', '_GridItem5'),
              ],
              onSelected: (String action) {
                switch (action) {
                  case '_GridItem2':
                    setState(() {
                      //_mywidget = _GridItem2();
                    });
                    break;
                  case '_GridItem3':
                    setState(() {
                      //_mywidget = _GridItem3();
                    });
                    break;
                  case '_GridItem4':
                    setState(() {
                      //_mywidget = _GridItem4();
                    });
                    break;
                  case '_GridItem5':
                    setState(() {
                      //_mywidget = _GridItem5();
                    });
                    break;
                }
              },
            ),
          ],
        ),
        body: _renderBody(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  _renderBody() => SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              children: [
                rectBorerWidget,
                roundedRectBorderWidget,
                customBorder,
                roundStrokeCap,
                solidBorder,
                fullWidthPath,
              ],
            ),
          ),
        ),
      );

  /// Draw a border with rectangular border
  Widget get rectBorerWidget {
    return DottedBorder(
      dashPattern: [8, 4],
      strokeWidth: 2,
      child: Container(
        height: 200,
        width: 120,
        color: Colors.red,
      ),
    );
  }

  /// Draw a border with a rounded rectangular border
  Widget get roundedRectBorderWidget {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      padding: EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: 200,
          width: 120,
          color: Colors.amber,
        ),
      ),
    );
  }

  /// Draw a border with custom path border
  Widget get customBorder {
    Path customPath = Path()
      ..moveTo(20, 20)
      ..lineTo(50, 100)
      ..lineTo(20, 200)
      ..lineTo(100, 100)
      ..lineTo(20, 20);

    return DottedBorder(
      customPath: (_) => customPath,
      color: Colors.indigo,
      dashPattern: [8, 4],
      strokeWidth: 4,
      child: Container(
        height: 220,
        width: 120,
        color: Colors.green.withAlpha(20),
      ),
    );
  }

  /// Set border stroke cap
  Widget get roundStrokeCap {
    return DottedBorder(
      dashPattern: [8, 4],
      strokeWidth: 2,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      radius: Radius.circular(5),
      child: Container(
        height: 200,
        width: 120,
        color: Colors.red,
      ),
    );
  }

  Widget get solidBorder {
    return DottedBorder(
      dashPattern: [4, 3],
      strokeWidth: 2,
      strokeCap: StrokeCap.round,
      child: Container(
        color: Colors.green,
        height: 200,
        width: 120,
      ),
    );
  }

  Widget get fullWidthPath {
    return DottedBorder(
      customPath: (size) {
        return Path()
          ..moveTo(0, 20)
          ..lineTo(size.width, 20);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(),
      ),
    );
  }
}
