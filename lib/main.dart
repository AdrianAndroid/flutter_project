import 'package:flutter/material.dart';

// 数据传递/状态管理 一ValueNotifier
// https://www.jianshu.com/p/a50c0bf5de81
// Flutter ValueNotifier 异步通信、ValueListenableBuilder
// https://zhuanlan.zhihu.com/p/266663396
// // Provider
// // ValueNotifier （就是本文了）
// // StreamController
// // EventBus
// // Bloc

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
        body: ValueNotifierDemo(),
      ),
    );
  }
}

class ValueNotifierDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ValueNotifierDemoState();
}

class _ValueNotifierDemoState extends State<ValueNotifierDemo> {
  ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();

    /// 添加数据的变化监听
    _valueNotifier.addListener(update);
  }

  @override
  void dispose() {
    super.dispose();

    /// 组件销毁的时候注销监听
    _valueNotifier.removeListener(update);
  }

  void update() {
    print('数据变化监听回调');
    // 刷新重建界面
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(_valueNotifier.value.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 修改值
          _valueNotifier.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
