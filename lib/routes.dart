import 'package:flutter/material.dart';
import 'package:flutter_project/about.dart';
import 'package:flutter_project/home.dart';
import 'package:gallery/routes.dart';

class RouteGenerator {
  //配置路由
  static final routes = {
    ...GalleryRouteGenerator.routes,
    "/": (context, {arguments}) => MyHomePage(title: '画廊'),
    "/about": (context, {arguments}) => About(),
  };

  // flutter onGenerateRoute原生路由简单封装及页面传参
  // https://www.jianshu.com/p/4f5019150036
  // Flutter注册静态路由跳转和动态路由跳转及传参
  // https://www.jianshu.com/p/8eaf499154ec
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final Function? pageContentBuilder = routes[name!];
    if (pageContentBuilder != null) {
      return PageRouteBuilder(
          pageBuilder: (context, __, ___) =>
              pageContentBuilder(context, arguments: settings.arguments),
          transitionDuration: Duration(milliseconds: 150),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c));

      // final Route route = MaterialPageRoute(
      //     builder: (context) =>
      //         å(context, arguments: settings.arguments));
      // return route;
    } else {
      return _errorPage('找不到页面');
    }
  }

  static Route _errorPage(msg) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: Text('未知页面')), body: Center(child: Text(msg)));
    });
  }
}
