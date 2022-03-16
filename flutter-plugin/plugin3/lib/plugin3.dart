
import 'dart:async';

import 'package:flutter/services.dart';

class Plugin3 {
  static const MethodChannel _channel = MethodChannel('plugin3');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
