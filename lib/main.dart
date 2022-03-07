import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/config.dart';

//https://www.wanandroid.com/banner/json

//https://www.jianshu.com/p/cc59c14de9bd

//https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png
//https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png
//https://www.wanandroid.com/blogimgs/ab17e8f9-6b79-450b-8079-0f2287eb6f0f.png
//https://www.wanandroid.com/blogimgs/fb0ea461-e00a-482b-814f-4faca5761427.png
//https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png
//https://www.wanandroid.com/blogimgs/00f83f1d-3c50-439f-b705-54a49fc3d90d.jpg

const String url1 = 'https://www.wanandroid'
    '.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png';
const String url2 = 'https://www.wanandroid'
    '.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png';
const String url3 = 'https://www.wanandroid'
    '.com/blogimgs/ab17e8f9-6b79-450b-8079-0f2287eb6f0f.png';
const String url4 = 'https://www.wanandroid'
    '.com/blogimgs/fb0ea461-e00a-482b-814f-4faca5761427.png';
const String url5 = 'https://www.wanandroid'
    '.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png';
const String url6 = 'https://www.wanandroid'
    '.com/blogimgs/00f83f1d-3c50-439f-b705-54a49fc3d90d.jpg';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageView',
      home: Scaffold(
        appBar: AppBar(title: Text('PageView')),
        body: Container(child: PageViewDemo()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageViewDemoState();
}

class PageViewDemoState extends State<PageViewDemo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('PageView'),
          Container(
            height: 200,
            color: Colors.grey,
            child: _buildPageViewOne(),
          ),
          Text('无限滚动'),
          Container(
            height: 200,
            color: Colors.grey,
            child: _buildPageViewTwo(),
          ),
        ],
      ),
    );
  }

  _buildPageViewOne() => PageView(
        scrollDirection: Axis.horizontal, // 滚动方向
        controller: PageController(
          viewportFraction: 0.9, // 控制每一个Page不占满
        ),
        onPageChanged: (int index) {
          print('onPageChange index=$index');
        },
        children: [
          MyPage1(),
          MyPage2(),
          MyPage3(),
        ],
      );

  _buildPageViewTwo() {
    List<Widget> pageList = [MyPage1(), MyPage2(), MyPage3()];
    return PageView.builder(
      itemCount: 10000,
      itemBuilder: (context, index) {
        return pageList[index % (pageList.length)];
      },
    );
  }
}
