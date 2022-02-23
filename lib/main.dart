import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

Map<String, WidgetBuilder> routers = {
  '/route1': (context, {arguments}) => Page(arguments: arguments)
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // 处理Named页面跳转 传递参数
      onGenerateRoute: (RouteSettings settings) {
        // 统一处理
        final String name = settings.name ?? "";
        final Function? pageContentBuilder = routers[name];
        if (pageContentBuilder != null) {
          final Route route = MaterialPageRoute(
            builder: (context) {
              //将RouteSettings中的arguments参数取出来，通过构造函数传入
              return pageContentBuilder(context, arguments: settings.arguments);
            },
            settings: settings,
          );
          return route;
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
      //routes优先执行，所以必须注释掉，否则onGenerateRoute方法不会调用
      //routes: routers,
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo Home Page')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/route1',
                arguments: {'name': 'hello world!!!'},
              );
            },
            child: Text('跳转Page'),
          ),
        ],
      ),
    );
  }
}

class Page extends StatelessWidget {
  Page({this.arguments});

  final Map? arguments;

  @override
  Widget build(BuildContext context) {
    String name = arguments != null ? arguments!['name'] ?? 'null' : 'null';
    print('arguments name --> $name');
    return Material(
      child: Center(
        child: Text("this page name is $name}"),
      ),
    );
  }
}
