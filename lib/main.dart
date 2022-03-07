import 'package:flutter/material.dart';

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
        body: NotificationRoute(),
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