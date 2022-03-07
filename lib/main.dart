import 'dart:math';

import 'package:flutter/material.dart';

// 8.6 通知 Notification
// https://book.flutterchina.club/chapter8/notification.html

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
        //body: NotificationRoute(),
        body: ParentWidget(),
      ),
    );
  }
}

class NotificationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NotificationRoutestate();
}

class NotificationRoutestate extends State<NotificationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    // 监听通知
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + "";
        });
        return true;
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                MyNotification("Hi").dispatch(context);
              },
              child: Text("Send Notification"),
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () => MyNotification("Hi").dispatch(context),
                  child: Text("Send Notification"),
                );
              },
            ),
            Text(_msg),
          ],
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  final String msg;

  MyNotification(this.msg);
}

// // 遍历回调，回对每一个父级Element执行此回调
// bool visitAncestor(Element element) {
//   // 判断当前element对应的widget是否是NotificationListener
//
//   // 由于NotificationListener是继承自StatelessWidget.
//   // 故先判断是否是StateElement
//   if (element is StatelessElement) {
//     // 是StatelessElement,则获取element对应的Widget，判断
//     // 是否是NotificationListener.
//     final StatelessElement widget = element.widget as StatelessElement;
//     if (widget is NotificationListener<Notification>) {
//       //  是NotificationListener,则调用NotificationListener的_dispatch方法
//       if (widget._dispatch(this, element)) {
//         return false;
//       }
//     }
//     return true;
//   }
// }
//
// bool _dispatch(Notification notification, Element element) {
//   // 如果通知监听器不为空，并且当前通知类型是该NotificationListener
//   // 监听的通知类型， 则调用当前NotificationListener的onNotification
//   if (onNotification != null && notification is T) {
//     final bool result = onNotification(notification);
//     // 返回值决定是否继续向上遍历
//     return result == true;
//   }
//   return false;
// }

// 创建子Widget发送通知
class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          MyNotification("我是随机下面发送的数据:${Random().nextInt(1000)}")
              .dispatch(context);
        },
        child: Text("提交"),
      ),
    );
  }
}

// parentWidget使用NotificationListener接收通知并显示
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String msg = "";

  onReceiveMessage(String message) {
    setState(() {
      msg = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      child: Column(
        children: [
          Text(msg),
          ChildWidget(),
        ],
      ),
      onNotification: (notification) {
        onReceiveMessage(notification.msg);
        return true;
      },
    );
  }
}
