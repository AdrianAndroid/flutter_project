import 'package:flutter/material.dart';

// 给Flutter中的Widget设置透明度
// https://www.jianshu.com/p/c87e147314a4

// 滚动监听
// NotificationListener监听滚动事件和ScrollController区别
// 1，通过NotificationListener可以在从可滚动组件到widget树根之间任意位置都能监听。
//  而ScrollController只能和具体的可滚动组件关联后才可以。
// 2，收到滚动事件后获得的信息不同；NotificationListener在收到滚动事件时，
//  通知中会携带当前滚动位置和ViewPort的一些信息，而ScrollController只能获取当前滚动位置。

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ScrollController')),
      body: Stack(
        children: [
          first ? ControllerRoute() : ScrollNotificationRoute(),
          ElevatedButton(
            onPressed: () {
              setState(() {
                first = !first;
              });
            },
            child: Text('Toggle'),
          ),
        ],
      ),
    );
  }
}

class ControllerRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ControllerRouteState();
}

class ControllerRouteState extends State<ControllerRoute> {
  ScrollController controller = ScrollController();
  bool showfab = false; // 控制按钮是否显示

  @override
  void initState() {
    super.initState();
    // 监听滚动位置
    controller.addListener(() {
      print(controller.offset); // 滚动位置
      if (controller.offset < 1500 && showfab) {
        setState(() {
          showfab = false;
        });
      } else if (controller.offset >= 1500 && showfab == false) {
        setState(() {
          showfab = true;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(title: Text('item $index'));
          },
          itemCount: 200, //个数
          itemExtent: 30, // 高度
          controller: controller,
        ),
      ),
      floatingActionButton: showfab
          ? FloatingActionButton(
              onPressed: () {
                // 点击返回到顶部， 带动画
                controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.linear, // 匀速
                );
              },
              child: Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}

// 监听ListView滚动通知
class ScrollNotificationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScrollNotificationRouteState();
}

class ScrollNotificationRouteState extends State<ScrollNotificationRoute> {
  String progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滑动")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Scrollbar(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              double pro = notification.metrics.pixels /
                  notification.metrics.maxScrollExtent;
              setState(() {
                progress = '${(pro * 100).toInt()}%';
              });
              return true;
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                ListView.builder(
                  itemCount: 100,
                  itemExtent: 50,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        'zzz _ $index',
                        style: TextStyle(wordSpacing: 3),
                      ),
                    );
                  },
                ),
                CircleAvatar(
                  child: Text(progress),
                  backgroundColor: Colors.blueAccent,
                  radius: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
