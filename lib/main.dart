import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project/event_bus_model.dart';
import 'package:flutter_project/second_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyHome(),
    ),
  );
}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomeState();
  }
}

class _MyHomeState extends State<MyHome> {
  int count = 0;

  StreamSubscription<EventFn>? eventBusFn;

  @override
  void initState() {
    super.initState();
    eventBusFn = eventBus.on<EventFn>().listen((event) {
      count = count + event.count;
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    // 取消订阅
    eventBusFn?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EventBus')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // 路由跳转
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return SecondPage();
              }));
            },
            child: Text('跳转到第二页'),
          ),
          Text('--显示的数字--> $count'),
          ElevatedButton(
            onPressed: () {
              eventBus.fire(EventFn(1));
            },
            child: Text('增加数字'),
          ),
        ],
      ),
    );
  }
}
