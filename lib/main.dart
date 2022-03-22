import 'package:flutter/material.dart';

// 适配原理
// 1。FittedBox在布局子组件时忽略其父组件传递的约束，可以允许子组件无限大，即FittedBox传递给子组件的约束为
// （0<=width<=double.infinity, 0<=height<=double.infinity）
// 2。FittedBox对子组件布局结束后可以获得子组件真实的大小
// 3。FittedBox知道子组件的真实大小也知道他父组件的约束，那么FittedBox就可以通过指定的适配方式
// （BoxFit枚举中指定），让其子组件FittedBox父组件的约束范围内按照指定的方式显示。

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
        body: SingleRowZoomLayoutDemo(),
        // body: FittedBoxDemo(),
      ),
    );
  }
}

// FittedBox简单的例子
class FittedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            wContainer(BoxFit.none),
            Text('Wendux'),
            wContainer2(BoxFit.contain),
            Text('Flutter中国'),
          ],
        ));
  }

  Widget wContainer(BoxFit boxFit) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        // 子容器超过父容器大小
        child: Container(width: 60, height: 70, color: Colors.blue),
      ),
    );
  }

  Widget wContainer2(BoxFit boxFit) {
    return ClipRect(
      // 将超出子组件布局范围的绘制内容裁剪掉
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
        child: FittedBox(
          fit: boxFit,
          // 子容器超过父容器大小
          child: Container(width: 60, height: 70, color: Colors.blue),
        ),
      ),
    );
  }
}

class SingleRowZoomLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          wRow('  90000000000000000 '),
          FittedBox(child: wRow('  90000000000000000 ')),
          wRow(' 800 '),
          FittedBox(child: wRow(' 800 ')),
        ]
            .map(
              (e) => Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: e,
          ),
        )
            .toList(),
      ),
    );
  }

  // 直接使用Row
  Widget wRow(String text) {
    Widget child = Text(text);
    child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [child, child, child],
    );
    return child;
  }
}

class SingleLineFittedBox extends StatelessWidget {
  final Widget? child;

  const SingleLineFittedBox({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return FittedBox(
        child: ConstrainedBox(
          constraints: constraints.copyWith(
            // 让maxWidth使用屏幕宽度
            maxWidth: constraints.maxWidth,
          ),
          child: child,
        ),
      );
    });
  }
}

class LayoutLogPrint<T> extends StatelessWidget {
  final Widget child;
  final T? tag;

  const LayoutLogPrint({Key? key, this.tag, required this.child})
      : super(key: key); //指定日志log

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // assert在编译release版本时会被去除
      assert(() {
        print('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }
}