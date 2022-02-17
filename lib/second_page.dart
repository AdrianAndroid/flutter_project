import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/event_bus_model.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SeondPage')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              eventBus.fire(EventFn(1000));
            },
            child: Text('生成事件'),
          )
        ],
      ),
    );
  }
}
