import 'dart:core';
import 'package:flutter/material.dart';

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
            child: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('复制粘贴'),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(
                        color: Colors.black,
                        width: 4,
                        style: BorderStyle.solid,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CODE:  UJGFKLM',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.copy,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
