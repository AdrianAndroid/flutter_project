import 'package:flutter/material.dart';

// 给Flutter中的Widget设置透明度
// https://www.jianshu.com/p/c87e147314a4

void main() {
  runApp(MaterialApp(home: ControllerRoute()));
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
      appBar: AppBar(title: Text('ScrollController')),
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
