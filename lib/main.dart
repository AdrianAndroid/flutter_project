import 'package:flutter/material.dart';

class SharedDataWidget extends InheritedWidget {
  final int data;

  SharedDataWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child); //需要在子树中共享的数据，保存点击次数

  // 定义一个便捷方法，方便子树中的widget获取共享数据
  static SharedDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedDataWidget>();
  }

  // 该回调决定当data发生变化时，是否通知子树中以来data的widget
  @override
  bool updateShouldNotify(covariant SharedDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(title: Text('Hello')),
        body: InheritedWidgetTestRoute(),
      ),
    );
  }
}

class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    print('__TestWidgetState build.');
    return Text(SharedDataWidget.of(context)!.data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print('Dependencies change.');
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SharedDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: _TestWidget(),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                ++count;
              }),
              child: Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}
