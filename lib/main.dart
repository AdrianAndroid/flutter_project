import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//简单介绍Platfrom Channel的三个API
// MethodChannel : Flutter与原生方法相互调用，用于方法掉用。
// EventChannel : 原生发送消息，Flutter接收，用于数据流通信
// BasicMessageChannel : Flutter与原生相互发送消息，用于数据传递
//             | 编码类型               | 消息格式
//             | BinaryCodec           | 发送二进制消息时
//             | JSONMessageCodec      | 发送Json格式消息时
//             | StandardMessageCodec  | 发送基本型数据时
//             | StringCodec           | 发送String类型消息时

// 几个链接资料
// https://blog.csdn.net/m0_37973043/article/details/108507194
// https://blog.csdn.net/vitaviva/article/details/104260820
// https://blog.csdn.net/unicorn97/article/details/102463153
// https://blog.csdn.net/sa3221sa/article/details/122434607

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('AppBar')),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = 'Failed to get battery level: ${e.message}';
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: _getBatteryLevel,
            child: const Text('Get Battery Level'),
          ),
          Text(_batteryLevel),
        ],
      ),
    );
  }
}
