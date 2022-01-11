import 'package:flutter/material.dart';
import 'package:flutter_project/home.dart';
import 'package:flutter_project/routes.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: InheritedWidgetTestRoute(),
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child); //需要在子树中共享的数据， 保存点击次数

  final int data;

  // 定义一个快捷方法， 方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    // context.getElementForInheritedWidgetOfExactType()
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  // 返回调决定当data发生变化时， 是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (oldWidget is ShareDataWidget) {
      return oldWidget.data != data;
    } else {
      return false;
    }
  }
}

class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // 使用InheritedWidget的共享数据
    return Text(ShareDataWidget.of(context)!.data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 父或祖先widget中的InheritedWidget改变（updateShouldNotify返回）时会被调用
    // 如果build中没有依赖InheritedWidget,则此回调不会被调用
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
      child: ShareDataWidget(
        // 使用ShareDataWidget
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: _TestWidget(),
            ),
            ElevatedButton(
              onPressed: () => setState(() => ++count),
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
