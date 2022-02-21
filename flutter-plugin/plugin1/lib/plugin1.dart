
import 'dart:async';

import 'package:flutter/services.dart';

// https://juejin.cn/post/6844904072969994248
// Flutter插件iOS端开发教程
// flutter build ios  (主要是:pod install)
//

class Plugin1 {
  static const MethodChannel _channel =
      const MethodChannel('plugin1');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
