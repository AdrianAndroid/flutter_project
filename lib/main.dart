import 'dart:core';

import 'package:flutter/material.dart';

// 看这个资料
// https://www.jianshu.com/p/fb3bf633ee12
// flutter gridview 自适应_Flutter相册优化指北
// https://blog.csdn.net/weixin_39982537/article/details/111220902

double _childAspectRatio = 169 / 238;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

_buildRoundContainer(String item) => Column(
      children: [
        Container(
          width: 169,
          height: 169,
          //padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(169),
          ),
          child: Column(
            children: [
              Image(image: AssetImage('assets/shop2.png')),
            ],
          ),
        ),
        SizedBox(height: 12),
        Center(
          child: Text(
            'Tops$item',
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );

class _MyAppState extends State<MyApp> {
  Widget? _mywidget;

  void initState() {
    super.initState();
    _mywidget = _GridItem2();
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
                      _mywidget = _GridItem2();
                    });
                    break;
                  case '_GridItem3':
                    setState(() {
                      _mywidget = _GridItem3();
                    });
                    break;
                  case '_GridItem4':
                    setState(() {
                      _mywidget = _GridItem4();
                    });
                    break;
                  case '_GridItem5':
                    setState(() {
                      _mywidget = _GridItem5();
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

class _GridItem2 extends StatelessWidget {
  _getItem(String title) {
    double width = 169;
    return Column(
      children: [
        SizedBox(height: 12),
        Container(
          width: width,
          height: width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(width),
          ),
          child: Image(image: AssetImage('assets/shop2.png')),
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  _getOneLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _getItem('Tops1'),
        _getItem('Tops1'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getOneLine(),
        _getOneLine(),
      ],
    );
  }
}

class _GridItem3 extends StatelessWidget {
  _getItem(String title) {
    return Column(
      children: [
        SizedBox(height: 12),
        Container(
          width: 109,
          height: 109,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(109),
          ),
          child: Image(image: AssetImage('assets/shop2.png')),
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  _getOneLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _getItem('Tops1'),
        _getItem('Tops1'),
        _getItem('Tops1'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getOneLine(),
        _getOneLine(),
      ],
    );
  }
}

class _GridItem4 extends StatelessWidget {
  _getItem(String title) {
    double width = 79;
    return Column(
      children: [
        SizedBox(height: 12),
        Container(
          width: width,
          height: width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(width),
          ),
          child: Image(image: AssetImage('assets/shop2.png')),
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  _getOneLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _getItem('Tops1'),
        _getItem('Tops1'),
        _getItem('Tops1'),
        _getItem('Tops1'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getOneLine(),
        _getOneLine(),
      ],
    );
  }
}

class _GridItem5 extends StatelessWidget {
  _getItem(String title) {
    double width = 61;
    return Column(
      children: [
        SizedBox(height: 12),
        Container(
          width: width,
          height: width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(width),
          ),
          child: Image(image: AssetImage('assets/shop2.png')),
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  _getOneLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _getItem('Tops1'),
        _getItem('Tops1'),
        _getItem('Tops1'),
        _getItem('Tops1'),
        _getItem('Tops1'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getOneLine(),
        _getOneLine(),
      ],
    );
  }
}
