import 'package:flutter/material.dart';

// 第一种
class Singleton1 {
  Singleton1._privateConstructor();

  static final Singleton1 _instance = Singleton1._privateConstructor();

  factory Singleton1() {
    return _instance;
  }
}

void main() {
  print('---first---');
  Singleton1 s1 = Singleton1();
  Singleton1 s2 = Singleton1();
  print(s1 == s2);
}