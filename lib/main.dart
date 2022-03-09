import 'dart:core';

import 'package:flutter/material.dart';

// Flutter:使用GridView.count实现简单商品列表
// https://juejin.cn/post/6862605879289675784

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('单个的商品列表')),
        body: Container(
          width: double.infinity,
          color: Colors.grey,
          child: Stack(
            children: [
              SingeleProductItem(
                imgWidth: 172,
                imgHeight: 233,
                itemWidth: 172,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingeleProductItem extends StatefulWidget {
  final double? imgWidth;
  final double? imgHeight;
  final double? itemWidth;

  const SingeleProductItem({
    Key? key,
    this.imgWidth,
    this.imgHeight,
    this.itemWidth,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SingeleProductItemState();
}

class _SingeleProductItemState extends State<SingeleProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.itemWidth,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: widget.imgWidth,
                  height: widget.imgHeight,
                  color: Color(0xFFF3F3F3),
                  child: Image.asset('assets/shop2.png'),
                ),
                SizedBox(height: 8),
                Text(
                  'Hooded sweater, Autumn, charming',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    Text(
                      '\$420.00',
                      style: TextStyle(
                        color: Color(0xFFC20000),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '\$66.00',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 折扣比例
          Container(
            color: Color(0xFFC20000),
            padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
            child: Text(
              '-60%',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
