import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/config.dart';

//https://www.wanandroid.com/banner/json

//https://www.jianshu.com/p/cc59c14de9bd

// 推荐几款Github上带动画效果的PageView
// Travel Cards
// https://github.com/gskinnerTeam/flutter_vignettes/tree/master/vignettes/parallax_travel_cards_list
// Mindfullness Gooey Transition
// https://github.com/gskinnerTeam/flutter_vignettes/tree/master/vignettes/gooey_edge
// page-transformer
// https://github.com/roughike/page-transformer
// transformer_page_view
// https://github.com/best-flutter/transformer_page_view
// smooth_page_indicator
// https://github.com/Milad-Akarie/smooth_page_indicator

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
          Text('实现指示器'),
          Container(
            height: 200,
            color: Colors.grey,
            child: _buildPageViewThree(),
          ),
          Text('切换动画'),
          Container(
            height: 200,
            color: Colors.grey,
            child: ViewPage(),
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

  List<String> pageList = ['PageView1', 'PageView2', 'PageView3'];
  int _currentPageIndex = 0;

  _buildPageViewThree() {
    return Center(
      child: Container(
        height: 230,
        child: Stack(
          children: [
            PageView.builder(
              onPageChanged: (int index) {
                setState(() {
                  _currentPageIndex = index % (pageList.length);
                });
              },
              itemCount: 10000,
              itemBuilder: (context, index) {
                return _buildPageViewItem(pageList[index % (pageList.length)]);
              },
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pageList.length,
                    (index) {
                      print('_buildPageViewThree List.generate.');
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPageIndex == index
                                ? Colors.blue
                                : Colors.grey),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildPageViewItem(String txt, {Color color = Colors.red}) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        txt,
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }
}

class ViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  var imgList = [
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2877516247,37083492&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2877516247,37083492&fm=26&gp=0.jpg',
  ];

  late PageController _pageController;
  var _currPageValue = 0.0;

  // 缩放系数
  double _scaleFactor = .8;

  // view page height
  double _height = 230.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      child: PageView.builder(
        itemBuilder: (context, index) => _buildPageItem(index),
        itemCount: 10,
        controller: _pageController,
      ),
    );
  }

  _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();

    print('_currPageValue.floor() ---> ${_currPageValue.floor()}');

    if (index == _currPageValue.floor()) {
      // 当前
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == _currPageValue.floor() + 1) {
      // 右边的Item
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == _currPageValue.floor() - 1) {
      // 左边
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else {
      // 其他， 不在屏幕显示的item
      matrix4 = Matrix4.diagonal3Values(1.0, _scaleFactor, 1.0)
        ..setTranslationRaw(0.0, _height * (1 - _scaleFactor) / 2, 0.0);
    }

    return Transform(
      transform: matrix4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(imgList[index % 2]),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
