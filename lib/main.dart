import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Flutter 中使用svg资源
// https://www.cnblogs.com/Im-Victor/p/12626969.html

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SVG',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutte SVG Page.'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SvgPicture picture0 = SvgPicture.asset(
      'assets/product.svg',
      color: Colors.grey,
    );
    SvgPicture picture1 = SvgPicture.asset(
      'assets/product.svg',
      color: Colors.redAccent,
    );
    SvgPicture picture2 = SvgPicture.asset(
      'assets/product.svg',
      color: Colors.blueAccent,
    );
    SvgPicture picture3 = SvgPicture.asset(
      'assets/product.svg',
      color: Colors.greenAccent,
    );
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          SizedBox(width: 50, height: 50, child: picture0),
          SizedBox(width: 50, height: 50, child: picture1),
          SizedBox(width: 50, height: 50, child: picture2),
          SizedBox(width: 50, height: 50, child: picture3),
        ],
      ),
    );
  }
}
