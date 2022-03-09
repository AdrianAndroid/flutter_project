import 'dart:core';

import 'package:flutter/material.dart';

// Flutter:使用GridView.count实现简单商品列表
// https://juejin.cn/post/6862605879289675784

void main() => runApp(MaterialApp(home: ListPages()));

class ListPages extends StatefulWidget {
  @override
  _ListPagesState createState() => _ListPagesState();
}

class _ListPagesState extends State<ListPages> {
  ScrollController _leftScrollController = ScrollController(); // 滚动左边监听
  ScrollController _rightScrollController = ScrollController(); // 滚动右边监听
  ScrollController _fatherScrollController = ScrollController(); // 滚动右边监听

  @override
  void initState() {
    _leftScrollController.addListener(() {
      print(_leftScrollController.offset); //打印滚动位置

      if (_leftScrollController.offset == 0.0) {
        // 拉到顶部
        // _fatherScrollController.jumpTo(0.0);
        _fatherScrollController.animateTo(.0,
            duration: Duration(milliseconds: 200), curve: Curves.ease);
      }

      if (_leftScrollController.position.pixels ==
          _leftScrollController.position.maxScrollExtent) {
        // 拉到底部
        print('----left----');
        // _fatherScrollController.jumpTo(_leftScrollController.position.maxScrollExtent);
        _fatherScrollController.animateTo(
            _leftScrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease);
        // physics: new NeverScrollableScrollPhysics(), //禁用滑动事件
      }
    });

    _rightScrollController.addListener(() {
      print(_rightScrollController.offset); //打印滚动位置

      if (_rightScrollController.offset == 0.0) {
        // 拉到顶部
        // _fatherScrollController.jumpTo(0.0);
        _fatherScrollController.animateTo(.0,
            duration: Duration(milliseconds: 200), curve: Curves.ease);
      }

      if (_rightScrollController.position.pixels ==
          _rightScrollController.position.maxScrollExtent) {
        // 拉到底部
        print('----right----');
        // _fatherScrollController.jumpTo(_rightScrollController.position.maxScrollExtent);
        _fatherScrollController.animateTo(
            _leftScrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease);
      }
    });

    super.initState();
  }

  @override
  void deactivate() {
    _leftScrollController.dispose(); // 为了避免内存泄露，需要调用_controller.dispose
    _rightScrollController.dispose(); // 为了避免内存泄露，需要调用_controller.dispose
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context));

    final mediaQuerySize = MediaQuery.of(context).size; // 获取手机信息
    final width = mediaQuerySize.width; // 获取宽度
    final height = mediaQuerySize.height; // 获取高度

    return Scaffold(
        //  appBar: AppBar(
        //     title: Text("商品列表"),
        //   ),
        body: Container(
            child: SingleChildScrollView(
      controller: _fatherScrollController,
      child: Column(children: <Widget>[
        // 头部
        Container(
            height: 150,
            decoration: BoxDecoration(
                // color: Colors.red
                ),
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              ),
            )),

        // 分割线
        Container(
          height: 10,
          decoration: BoxDecoration(color: Colors.green),
        ),

        // 中间
        Container(
            // height: 400,
            decoration: BoxDecoration(color: Colors.red),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                      height: height - 160,
                      decoration: BoxDecoration(color: Colors.black),
                      child: ListView(
                        controller: _leftScrollController,
                        shrinkWrap: true,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              _leftItem(),
                              _leftItem(),
                              _leftItem(),
                              _leftItem(),
                              _leftItem(),
                              _leftItem()
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                        height: height - 160,
                        decoration: BoxDecoration(color: Colors.blue),
                        child: ListView(
                          controller: _rightScrollController,
                          shrinkWrap: true,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                _rightItem(),
                                _rightItem(),
                                _rightItem(),
                                _rightItem(),
                                _rightItem(),
                                _rightItem()
                              ],
                            )
                          ],
                        )))
              ],
            )),

        // 底部
        Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.red),
          child: Row(
            children: <Widget>[Text('---底部---')],
          ),
        )
      ]),
    )));
  }

  _rightItem() {
    return (Container(
      height: 100,
      color: Colors.pink,
      margin: EdgeInsets.only(top: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text("右边"),
      ),
    ));
  }

  _leftItem() {
    return (Container(
      height: 100,
      color: Colors.pink,
      margin: EdgeInsets.only(top: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text("左边"),
      ),
    ));
  }
}
