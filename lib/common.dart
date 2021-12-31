// 提供五套可选主题色
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red
];

class Global {
  static SharedPreferences? prefs;

  // static Profile

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.wm.product");

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
    var _profile = prefs?.getString("profile") ?? "";

    if (_profile != null) {
      try {
        // _profile = Profi
      } catch (e) {
        print(e);
      }
    }
  }
}

class ProfileChangeNotifier extends ChangeNotifier {}

class UserModel extends ProfileChangeNotifier {}
