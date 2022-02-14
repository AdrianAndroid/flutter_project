// 一个扩展的作用
import 'dart:ui';

import 'package:flutter/cupertino.dart';

// 扩展在基本数据类型的扩展
extension IntExtension on int {
  toSay() {
    print('IntExtension Hello~');
  }
}

extension StringExtension1 on String {
  // 字符串转换成Color对象
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  // 字符串int
  parseInt() {
    return int.parse(this);
  }
}

// 扩展在类中的扩展
extension DateTimeExtension on DateTime {
  toFormatString() {
    //DateFormat dateFormat = new DateFormat("yyyy-MM-dd HH:mm:ss");
    return "to_format_string";
  }
}

// 扩展泛型
extension HclList<T> on List<T> {
  // 扩展属性
  int get doubleLength => length * 2;
  // 扩展操作符号
  List<T> operator -() => reversed.toList();
  // 一个链表分割成两个
  List<List<T>> split(int at) => <List<T>>[sublist(0, at), sublist(at)];
}

// 扩展在Widget中的应用
extension HclWidget on Widget {
  Widget marginAll(double margin) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(margin),
      child: this,
    );
  }
}