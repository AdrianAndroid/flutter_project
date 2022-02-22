import 'package:flutter/material.dart';
import 'package:models1/about.dart';
import 'package:models1/detail.dart';
import 'package:models1/gallery_home.dart';

class GalleryRouteGenerator {
  static const String ROUTE = '/';
  static const String DETAIL = '/gallery/detail';
  static const String ABOUT = '/gallery/about';

  // 配置路由
  static final routes = {
    ROUTE: (context, {arguments}) => MyHomePage(title: "画廊"),
    DETAIL: (context, {argument}) => Detail(gallery: argument),
    ABOUT: (context, {argument}) => GalleryAbout(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String name = settings.name;
    final Function pageContentBuilder = routes[name];
    if (pageContentBuilder != null) {
      return MaterialPageRoute(
        builder: (context) {
          if (settings.arguments != null) {
            return pageContentBuilder(
              context,
              // arguments: settings.arguments,
            );
          } else {
            return pageContentBuilder(context);
          }
        },
      );
    } else {
      return _errorPage('找不到页面');
    }
  }

  static Route _errorPage(msg) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text('未知页面')),
        body: Center(child: Text(msg)),
      );
    });
  }
}
